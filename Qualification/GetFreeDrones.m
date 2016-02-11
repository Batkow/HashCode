function index = GetFreeDrones(drone,nDrones,t);
  index = [];
  for i = 1 : nDrones
    if (drone(i).coolDown <= t)
      drone(i).coolDown = t;
      drone(i).load = 0;
      index = [index i];
    end
  end
end