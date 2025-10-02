clc;
clear; 
close all;
Mh = [ 2 -2  1  1;
      -3  3 -2 -1;
       0  0  1  0;
       1  0  0  0];

%% First curve
% Points
p1  = [3 0]; % start point
p2  = [3 5]; % end point
p1r = [-15 0]; % ref for tangent at p1
p2r = [-3 5]; % ref for tangent at p2

% Tangent vectors
r1 = p1r - p1; % [1 2]
r2 = p2r - p2; % [1 -2]

% Geometry vectors
Ghx = [p1(1); p2(1); r1(1); r2(1)];
Ghy = [p1(2); p2(2); r1(2); r2(2)];

% Parameter t
t = linspace(0,1,200);
T = [t.^3; t.^2; t; ones(size(t))];

% Parametric equations
X = T' * Mh * Ghx;
Y = T' * Mh * Ghy;

%% Second curve
p3  = [3 5];
p4  = [3 0];
p3r = [-3 5];
p4r = [-15 0];

r3 = p3r - p3; % [2 -3]
r4 = p4r - p4; % [0  2]

Ghx2 = [p3(1); p4(1); r3(1); r4(1)];
Ghy2 = [p3(2); p4(2); r3(2); r4(2)];

X2 = T' * Mh * Ghx2;
Y2 = T' * Mh * Ghy2;

%% Plot both curves
figure;
plot(X, Y, 'r', 'LineWidth', 2);
hold on;
plot(X2, Y2, 'b', 'LineWidth', 2);

% Draw control points
plot([p1(1) p2(1)], [p1(2) p2(2)], 'ko','MarkerFaceColor','k');
plot([p3(1) p4(1)], [p3(2) p4(2)], 'ko','MarkerFaceColor','k');

title('Piecewise Cubic Hermite Curves');
xlabel('X');
ylabel('Y');
axis equal;
grid on;
legend('Curve 1','Curve 2');