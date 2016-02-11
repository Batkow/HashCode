function [drone] = GetToTarget(drone,target)

  distance = drone.pos - target;
  
  drone.pos = target;
  drone.coolDown = drone.coolDown +   ceil(sqrt(sum(distance.^2)))+1;
  
  
end