function johnson(no_of_vertices,src,dest,edges,edge_start, edge_connected, edge_weight,G,D)
% prompt = 'Directed or UnDirected Graph? [d=Directed/ANY KEY=UnDirected]: ';
% strg = input(prompt,'s');
% prompt = 'How Many Vertices?\n ';
% no_of_vertices = input(prompt);
% nov=no_of_vertices;
% for i=1:nov
%     for j=1:no_of_vertices        
%         D(i,j)=0;
%     end
% end
% edge_start=[];
% s=[];
% t=[];
% psize=20;
% graph_edge=[];
% edge_connected=[];
% edge_weight=[];
% edges=0;
% prompt = 'create edges ';
% while edges<(no_of_vertices*(no_of_vertices-1))
%     prompt = 'enter first node';
%     first_node=input(prompt);
%     prompt = 'enter connected node';
%     second_node=input(prompt);
%     prompt = 'enter weight';
%     weight=input(prompt);
%     if first_node<1 || first_node>no_of_vertices || second_node<1 || second_node>no_of_vertices || first_node==second_node  
%         disp( 'enter valid edges')
%         continue;
%     end
%     edge_start=[edge_start;first_node];
%     s=[s first_node];
%     edge_connected=[edge_connected;second_node];
%     t=[t second_node];
%     edge_weight=[edge_weight;weight];
%     graph_edge=[graph_edge weight];
%     edges=edges+1;
%     D(first_node,second_node)=weight;
%     prompt = 'Do you want more edges? YES/NO [y/ANY KEY]: ';
%     str = input(prompt,'s');
%     if str=='y'
%         continue;
%     else
%         break;
%     end
% end
% for i=1:nov
%     D(i,i)=0;
% end
% if strg=='d'
%     G=digraph(s, t,graph_edge);
% else
%     G=graph(D);
% end
E=D;
nov=no_of_vertices;
for i=1:nov
    for j=1:no_of_vertices        
       if D(i,j)==0
           D(i,j)=-intmax;
       end
    end
end
% prompt = 'enter source vertex?\n ';
% src = input(prompt);
% prompt = 'enter destination vertex?\n ';
% dest = input(prompt);
new_edge_start=edge_start;
new_edge_connected=edge_connected;
new_edge_weight=edge_weight;
new_edges=edges;
for i=1:nov
    new_edge_start=[new_edge_start;nov+1];
    new_edge_connected=[new_edge_connected;i];
    new_edge_weight=[new_edge_weight;0];
    new_edges=new_edges+1;
end
newsrc=nov+1;
[d,p]=initdp(no_of_vertices+1);
d(newsrc)=0;
for i=1:(no_of_vertices)
    [nc,d,p]=bellman_algo(new_edges,new_edge_start,new_edge_connected,new_edge_weight,d,p);
end
if nc==1
    disp('negative cycle exists');
else
    for i=1:(no_of_vertices)
        h(i)=d(i);
    end
    
    for i=1:nov
        for j=1:no_of_vertices
           if D(i,j)~=-intmax
               D(i,j)=D(i,j)+h(i)-h(j);
           end
        end
    end
    
    Dijkstra_johnson(no_of_vertices,src,dest,G,D,E);
end
end
