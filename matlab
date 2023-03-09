clc
% Geometry
L = 10/100;    % Length of the rod [m]
H = 10/100;     % Width of the rod [m]
nx = 10;        
ny = 10;
x= linspace(0, L, nx);
y= linspace(0, L, ny);

dx = L/(nx-1);
dy = H/(ny-1);
beta = (dx/dy)^2;

%Boundary conditions
T = zeros(nx,ny);
T(:,1) = 100;
T(:,end) = 50;
T(1,:) = 80;
T(end,:) = 20;
T_old  = T;

%case1
err = 100;
k= 0;

while err > 1e-3
    k = k + 1;
    for i=2:nx-1
        for j=2:ny-1
        T(i,j) = (T(i+1,j) + T(i-1,j) + beta*(T(i,j+1) + T(i,j-1)))/(2*(1+ beta));
        end
    end
    err = abs(max(max(T-T_old)));
    T_old = T;
    err_p(k) =err;


%xlabel('No. of iterations', 'FontSize',14)
%ylabel('Residual [-]', 'FontSize',14)
%set(gca,'FontSize', 14)
%shg 
%pause(0.01)


%pause(0.01)
%xlabel('Length [m]', 'FontSize',14)
%ylabel('Height [m]', 'FontSize',14)
%set(gca,'FontSize', 14)
end
figure(1)
plot(err_p);
figure(2)
contourf(x,y,T,'ShowText','on')
shg 
fprintf('number of iterations to convergence = %d', k);
