function timeToComplete = actionCost( dronePos, targetPos )
% ASSUMES THAT DRONEPOS AND TARGETPOS ARE 2-VECTORS


distance = sqrt((dronePos(1) - targetPos(1))^2 + (dronePos(2) - targetPos(2))^2);

if (distance == 0)
    timeToComplete = 0;
else
    timeToComplete = ceil(distance) + 1;
end

end

