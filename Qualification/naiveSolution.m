

% first column: order index. second column: time when drone is free again
assignments = zeros(nDrones, 2);

completedOrders = zeros(nOrders, 1);
busyOrders = zeros(nOrders, 1);

% initial assignment of drones
for d=1:nDrones
    ordersToDo = find((completedOrders==0) .* (busyOrders==0));
    if (size(ordersToDo,1) < 1)
        % assign first free order to the drone
        assignments(d,1) = ordersToDo(1);
    end
end

% iterate time until a drone is free again


% loop until finished or time is up

t = 0;

while (t < nTurns)
    
    % find all drones that are not busy
    for d=1:nDrones
        if (assignments(d,2) >= t)
            % drone is free
            
            if (assignments(d,1) > 0)
                completedOrders(assignments(d,1), 1) = 1;
            end
            assignments(d,1) = 0;
        end
    end
    
    % for each drone, assign an order to it
    for d=1:nDrones
        if (assignments(d,1) == 0)
            ordersToDo = find((completedOrders==0) .* (busyOrders==0));
            if (size(ordersToDo,1) < 1)
                % assign first free order to the drone
                assignments(d,1) = ordersToDo(1);
                busyOrders(ordersToDo(1)) = 1;
                
                
            end
        end
    end
    
    % iterate time
end