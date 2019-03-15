tic
totalPointCounts = [100, 1000, 10000]; 

len = length(totalPointCounts);
insidePointCounts = zeros(len, 1);
area = zeros(len, 1);

%% main program
j = 0;
for N = totalPointCounts
    j = j + 1;
    
    % generate N random points with range [0, 1)
    points = rand(N, 2);
    
    % set axis and grid
    axis([0, 1, 0, 1]);
    grid on; % show grid

    if (j > 1)
        figure;
    end
    
    % draw points
    i = 1:N;
    plot(points(i, 1), points(i, 2), '*');
    hold on;

    % draw quarter circle
    axis square;
    f = ezplot('x^2+y^2-1=0', [0, 1, 0, 1]);
    set(f, 'LineWidth', 4, 'color', 'k');
    
    % count the number of points inside the quarter circle
    count = 0;
    for i = 1:N
        if ((points(i, 1)^2 + points(i, 2)^2) <= 1)
            count = count + 1;
        end
    end
    insidePointCounts(j, 1) = count;
    
    % calculate Pi: points inside/total points
    area(j, 1) = insidePointCounts(j, 1) ./ N;
    area(j, 2) = N;
    
    count
end

%% plot line chart
figure;
i = 1:3;
plot(area(i, 2), area(i, 1), '*-');
toc
