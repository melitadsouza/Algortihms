% #***************************************************************************************
%     #*    Title: Dijkstra's Algorithm
%     #*    Author: Dimas Aryo
%     #*    Date: 04/12/2012
%     #*
%     Availability:https://www.mathworks.com/matlabcentral/fileexchange/361
%     40-dijkstra-algorithm
%     #********************************************************************
function G = setupgraph(G,b,s)

if s==1
    for i=1 : size(G,1)
        for j=1 :size(G,1)
            if G(i,j)==0
                G(i,j)=b;
            end
        end
    end
end
if s==2
    for i=1 : size(G,1)
        for j=1 : size(G,1)
            if G(i,j)==b
                G(i,j)=0;
            end
        end
    end
end