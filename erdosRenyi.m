% #***************************************************************************************
%     #*    Title: Erdos-Renyi Random Graph
%     #*    Author: Pablo Blinder
%     #*    Date: 01/25/2005
%     #*    Availability:https://www.mathworks.com/matlabcentral/fileexchange/4206-erdos-renyi-random-graph
%     #********************************************************************
function [G]=erdosRenyi(nv,p,Kreg)
A=sparse(nv,nv);
Kreg=fix(abs(Kreg)/2);Kreg=(Kreg<1)+Kreg;

for k=1:Kreg
    
    A=sparse(A+diag(ones(1,length(diag(A,k))),k)+diag(ones(1,length(diag(A,nv-k))),nv-k));
end
A=sparse(A+eye(nv)); 
ne0=nnz(A);
%find connected pairs
[v1,v2]=find(A);
% P=permPairs(nv);%my version is faster
Dis=(rand(length(v1),1)<=p);%pairs to disconnect
A(v1(Dis),v2(Dis))=0;
vDis=unique([v1(Dis),v2(Dis)]);%disconnected vertices
nDis=ne0-nnz(A);sum(Dis);

%cycle trough disconnected pairs
disconPairs=[v1(Dis),v2(Dis)];
for n=1:nDis
    %choose one of the vertices from the disconnected pair
    i=ceil(rand*size(disconPairs,1));
    j=logical(1+rand>0.5);
    vDisToRec=disconPairs(i,j);
    %find non adjacent vertices and reconnect
    adj=[find(A(:,vDisToRec)) ; find(A(vDisToRec,:))'];
    nonAdj=setdiff(1:nv,adj);
    vToRec=nonAdj(ceil(rand*length(nonAdj)));
    S=sort([vDisToRec vToRec]);
    A(S(1),S(2))=1;
end
[x,y]=getNodeCoordinates(nv);
%make adjacency matrix symetric
A=A+A';
A=sparse(A-eye(nv)); 
G=struct('Adj',A,'x',x','y',y','nv',nv,'ne',nnz(A));

%Obtaining adjacency matrix
fields = getfield(G, 'Adj');
G = fields;
temp = zeros(nv);
for row = 1:nv
    for col = 1:nv
        if(G(row, col) == 1)
            temp(row, col) = 1;
        end
    end
end
G = temp;


