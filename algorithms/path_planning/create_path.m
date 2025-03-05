function [path] = create_path()

path = [2,  8.5];
path = [path; create_circle_portion(3.3,6.5,2,pi/2,0,0.08)];
path = [path; create_circle_portion(7.15,3.5,1.85,pi,2*pi,0.08)];
path = [path; [9, 9]];

end