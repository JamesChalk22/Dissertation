% Define the parameters of the simulation
num_balls = 10000; % number of balls to simulate
num_rows = 10; % number of rows in the board
p = 0.5; % probability of a ball falling to the left at each step

% Initialize the positions of the balls
positions = zeros(num_balls, num_rows); % matrix to hold the positions of the balls
positions(:, 1) = ones(num_balls, 1); % initially, all balls are at the top of the board

% Run the simulation
for i = 2:num_rows
  % Generate random numbers to determine the direction of each ball
  rand_nums = rand(num_balls, 1);
  
  % Update the positions of the balls based on the random numbers
  % If the random number is less than p, the ball falls to the left.
  % Otherwise, the ball falls to the right.
  positions(:, i) = positions(:, i-1) + (rand_nums < p);
end

% Plot the final positions of the balls
histogram(positions(:, end))





