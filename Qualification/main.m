clc, clear all, close all
fileId = fopen('mother_of_all_warehouses.in');
data = textscan(fileId,'%d',5);
data = data{1};

% Parameters
nRows = data(1);
nCols = data(2);
nDrones = data(3);
nTurns = data(4);
maxPayload = data(5);
data = textscan(fileId,'%d',1);
data = data{1};
nProducts  = data;

% Read n products
data = textscan(fileId,'%d',nProducts);
data = data{1};
productWeights = data;

% Read n warehouses
data = textscan(fileId,'%d',1);
data = data{1};
nWarehouses  = data;

for i = 1:nWarehouses
  data = textscan(fileId,'%d',2);
  pos = data{1};
  data = textscan(fileId,'%d',nProducts);
  storage = data{1};
  
  warehouse(i).pos = pos;
  warehouse(i).storage =  storage;
end

data = textscan(fileId,'%d',1);
data = data{1};
nOrders  = data;

for i = 1:nOrders
  data = textscan(fileId,'%d',2);
  pos = data{1};
  data = textscan(fileId,'%d',1);
  nItems = data{1};
  data = textscan(fileId,'%d',nItems);
  products = data{1};
  
  order(i).pos = pos;
  order(i).nItems = nItems;
  order(i).products = products;
end

fclose(fileId);

%% OLD SHIT MAYBE REMOVE
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

orderIndex = 5+nWarehouses*2;
% 1 offset
nOrders = data(orderIndex,1);

for i = 1:nOrders
  pos = data(orderIndex+1+nOrders*(i-1),:);
  pos(isnan(pos))=[];
  order(i).pos = pos;
  order(i).nItems = data(orderIndex+2+nWarehouses+nOrders*(i-1),1);
  products = data(orderIndex+3+nWarehouses+nOrders*(i-1),:);
  products(isnan(products)) = [];
  order(i).products = products;
end








