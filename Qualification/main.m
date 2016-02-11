clc, clear all, close all
fileId = fopen('redundancy.in');
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

%% 

for i = 1:nDrones
  drone(i).pos = warehouse(1).pos;
  drone(i).coolDown = 0;
  drone(i).load = 0;
end

t = 0;

while(t<500)
  indexFreeDrones = GetFreeDrones(drone,nDrones,t);
  
    
  % Give orders
  [drone,warehouse,order] = GiveOrders(drone,warehouse,order,nWarehouses,nOrders,indexFreeDrones,t,maxPayload,productWeights);
  
  if (isempty(indexFreeDrones))
    
  
  t = t + 1;
  
end

