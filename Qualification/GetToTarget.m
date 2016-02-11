function [drone] = GetToTarget(drone,target,index,order,product)

  distance = drone.pos - target;
  
  drone.pos = target;
  drone.coolDown = drone.coolDown +   ceil(sqrt(sum(distance.^2)))+1;
  fprintf('%i D %i %i 1 \n',index-1,order-1,product)
  
end