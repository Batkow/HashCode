function [drone, warehouse] = FindClosestWarehouse(drone,warehouse,product);

  minDistance = inf;
  % Loop through warehouses
  for i = 1:size(warehouse,2)
    %Check if warehouse has product
    if (warehouse(i).storage(product) ~= 0)
      %Calc distance
      dist = drone.pos - warehouse(i).pos;
      %Update to closest distance
      if ( sqrt(sum(dist.^2)) < minDistance)
        bestIndex = i;
        minDistance = sum(dist.^2);
      end
    end
  end
  
  
  warehouse(bestIndex).storage(product) = warehouse(bestIndex).storage(product) - 1;
  prevPos = drone.pos;
  drone.pos = warehouse(bestIndex).pos;
  minDistance = ceil(minDistance);
  drone.coolDown = drone.coolDown + minDistance + (minDistance ~= 0);