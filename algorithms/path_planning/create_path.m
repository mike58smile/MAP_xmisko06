function [path] = create_path()

path = create_linear(2,8.5,3.3,8.5,0.05);
path = [path; create_circle_portion(3.3,6.5,2,pi/2,0,0.16)];
path = [path; create_linear(5.3,6.5,5.3,3.5,0.05)];
path = [path; create_circle_portion(7.15,3.5,1.85,pi,2*pi,0.16)];
path = [path; create_linear(9,3.5,9,9,0.05)];
path = [path; [9, 9]];

end