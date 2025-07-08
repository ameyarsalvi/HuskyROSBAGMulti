function y = syncRotation(TrajRef,TrajB)

headRef = headingFromXY([TrajRef(:,1) TrajRef(:,2)]);
headRef = movmean(headRef,50);
head = headingFromXY([TrajB(:,1),TrajB(:,2)]);

figure
hold on
plot(headRef)
plot(head)

theta = head - headRef;

TrajC = [];

for i=1:length(theta)
    RotMat = [cos(theta(i)) sin(theta(i));
        -sin(theta(i)) cos(theta(i))];
    x = RotMat*[TrajB(i,1);TrajB(i,2)];
    TrajC = [TrajC;[x(1) x(2)]];
end

y = TrajC;

end