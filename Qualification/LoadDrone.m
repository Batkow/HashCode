function [drone,order,warehouse] = LoadDrone(drone,order,warehouse,productWeight,maxPayload)

  i = 1;
  j = 1;
  nRemovedItems = 0;
  position = [];
  orderEnd = 0;
  while ( j <=order(i).nItems-nRemovedItems)
    product = order(i).products(j);
    weight = productWeight(product+1);
    
    if (weight+drone.load < maxPayload)
      % Load orders
      drone.load = drone.load + weight;
      order(i).nItems = order(i).nItems -1;
      
      order(i).products(j) = [];
      position = order(i).pos;
      nRemovedItems = nRemovedItems +1;
      j = j - 1;
      % If last item taken remove it form order list
      if (order(i).nItems == 0)
        order(i) = [];
        orderEnd = 1;
      end
      
     %Find closest warehouse that has product and grab it!
    [drone,warehouse] = FindClosestWarehouse(drone,warehouse,product);
    [drone] = GetToTarget(drone,position);
      
    end
    j = j + 1;
    
    if (orderEnd==1)
      break;
    end
    
    %Load
    
    
    %Go to order id
    
      

  end




end