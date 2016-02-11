clc, clear all
data =importdata('test.in');

% Parameters
nRows = data(1,1);
nCols = data(1,2);
nDrones = data(1,3);
nTurns = data(1,4);
maxPayload = data(1,5);
% 1 offset
nProducts = data(2,1);
% 1 offset
weights = data(3,:);
weights(isnan(weights)) = [];
productWeights = weights;
% 1 offset
nWarehouses = data(4,1);

for i = 1 : nWarehouses
  pos = data(5+nWarehouses*(i-1),:);
  pos(isnan(pos))=[];
  warehouse(i).pos = pos;
  storage = data(6+nWarehouses*(i-1),:);
  storage(isnan(storage)) =[];
  warehouse(i).storage = storage;
  
end
% 1 offset
nOrders = data(9,1);

for i = 1:nOrders
  pos = data(10+nOrders*(i-1),:);
  pos(isnan(pos))=[];
  order(i).pos = pos;
  order(i).nItems = data(11+nOrders*(i-1),1);
  products = data(12+nOrders*(i-1),:);
  products(isnan(products)) = [];
  order(i).products = products;
end








