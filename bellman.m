function bellman(no_of_vertices,src,dest,edges,edge_start, edge_connected, edge_weight,G)
figure('name','Bellman Ford Algorithm');
 dg=plot(G,'EdgeLabel',G.Edges.Weight);
 hold on;
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
%     dg=plot(G,'Layout','layered','EdgeLabel',G.Edges.Weight);
%     hold on;
% else
%     G=graph(D);
%     dg=plot(G,'Layout','layered','EdgeLabel',G.Edges.Weight);
%     hold on;
% end

[d,p]=initdp(no_of_vertices);
% prompt = 'enter source vertex?\n ';
% s = input(prompt);
d(src)=0;

% prompt = 'enter destination vertex?\n ';
% dest = input(prompt);
% tic
for i=1:(no_of_vertices-1)
    [nc,d,p]=bellman_algo(edges,edge_start,edge_connected,edge_weight,d,p);
end
if nc==1
    disp('negative cycle exists');
else
    for i=1:no_of_vertices 
%         print_path(i,p);
        if(i==dest)
            fprintf('\nminimal_cost = \n\n\t\t%d',d(i));
            fprintf('\n\nPath: \n\t');
            graph_print(i,p,edge_weight,src,dg);
            fprintf('\n');
        end
    end
end
end
