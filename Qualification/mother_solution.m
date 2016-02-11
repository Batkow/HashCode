clc


orderWeights = zeros(nOrders,1);
for i=1:nOrders
  % MATLAB HAS 1 INDEXING:
  orderWeights(i) = sum(productWeights(order(i).products+1));
end

[orderWeights,index] = sort(orderWeights);
order = order(index);
nOneDroneOrders = sum(orderWeights <= 200);
distances = zeros(nOneDroneOrders,1);
for i=1:nOneDroneOrders
  distances(i) = norm(double(warehouse.pos - order(i).pos));
end
%%
droneState = zeros(nDrones,1);
droneAtWarehouse = zeros(nDrones,1);
droneHasCargo = zeros(nDrones,1);
nextOrder = 1;

for k=1:nTurns
  for l=1:nDrones
    if droneState(l) == 0
      % Drone can take command
      % Drone loads, delvier, unpack and return, order nextOrder
      droneState(l) = 2 + 2*ceil(distances(nextOrder));
      nextOrder = nextOrder + 1;
    end
  end
  % END OF TURN
  droneState = droneState - 1;
  % Break if no more one-drone-orders
  if nextOrder > nOneDroneOrders
    break;
  end
end