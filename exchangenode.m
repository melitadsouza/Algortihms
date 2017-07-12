% #***************************************************************************************
%     #*    Title: Dijkstra's Algorithm
%     #*    Author: Dimas Aryo
%     #*    Date: 04/12/2012
%     #*
%     Availability:https://www.mathworks.com/matlabcentral/fileexchange/361
%     40-dijkstra-algorithm
%     #********************************************************************
function G = exchangenode(G,a,b)

%Exchange element at column a with element at column b;
buffer=G(:,a);
G(:,a)=G(:,b);
G(:,b)=buffer;

%Exchange element at row a with element at row b;
buffer=G(a,:);
G(a,:)=G(b,:);
G(b,:)=buffer;