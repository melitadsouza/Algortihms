% #***************************************************************************************
%     #*    Title: Erdos-Renyi Random Graph
%     #*    Author: Pablo Blinder
%     #*    Date: 01/25/2005
%     #*    Availability:
%     https://www.mathworks.com/matlabcentral/fileexchange/4206-erdos-renyi-random-graph
%     #********************************************************************
 function [x,y]=getNodeCoordinates(nv)

center=[0,0];
theta=linspace(0,2*pi,nv+1);
rho=ones(1,nv+1);%fit radius and nv
[X,Y] = pol2cart(theta',rho');
X=X+center(1);
Y=Y+center(2);
x=X(1:end-1)*10;
y=Y(1:end-1)*10;
