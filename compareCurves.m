function [meanError, varianceError, errors] = compareCurves(referenceCurve, comparisonCurve)
    % Function to calculate the signed error between two curves based on arc length parameterization
    % Inputs:
    %   referenceCurve: 2xm matrix of path points for the reference curve
    %   comparisonCurve: 2xn matrix of path points for the comparison curve
    % Outputs:
    %   meanError: mean of the errors between the two curves
    %   varianceError: variance of the errors between the two curves
    %   errors: array of signed errors between the two curves for further analysis

    % Ensure the curves are 2xm and 2xn matrices
    assert(size(referenceCurve, 1) == 2, 'Reference curve must be a 2xm matrix');
    assert(size(comparisonCurve, 1) == 2, 'Comparison curve must be a 2xn matrix');

    % Arc length parameterization for the reference curve
    refDiffs = diff(referenceCurve, 1, 2);
    refArcLengths = [0, cumsum(sqrt(sum(refDiffs.^2, 1)))];

    % Arc length parameterization for the comparison curve
    compDiffs = diff(comparisonCurve, 1, 2);
    compArcLengths = [0, cumsum(sqrt(sum(compDiffs.^2, 1)))];

    % Determine a common arc length scale for interpolation
    commonArcLengths = linspace(0, min([refArcLengths(end), compArcLengths(end)]), max(length(refArcLengths), length(compArcLengths)));

    % Interpolate both curves to the common arc length scale
    interpolatedRefCurve = interp1(refArcLengths, referenceCurve', commonArcLengths, 'linear', 'extrap')';
    interpolatedCompCurve = interp1(compArcLengths, comparisonCurve', commonArcLengths, 'linear', 'extrap')';

    % Calculate the signed error between the reference curve and the interpolated comparison curve
    errors = interpolatedCompCurve - interpolatedRefCurve; % This gives a 2xn matrix of errors

    % Project errors onto the direction of the curve, if needed, or consider only one dimension
    % Here we assume you want to analyze the error in the Y direction (vertical error):
    %signedErrors = errors(2, :); % Only considering the Y difference for histogram
    signedErrors = sqrt(errors(1,:).^2+errors(2,:).^2);

    % Calculate mean and variance of the signed errors
    if isempty(signedErrors)
        meanError = NaN;
        varianceError = NaN;
        warning('All error values resulted in NaN after interpolation.');
    else
        meanError = mean(signedErrors);
        varianceError = var(signedErrors);
    end
    
    % Return signed errors for histogram plotting
    errors = signedErrors;
end