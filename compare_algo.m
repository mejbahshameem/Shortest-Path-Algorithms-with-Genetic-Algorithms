function compare_algo()  
prompt = 'Directed or UnDirected Graph? [d=Directed/ANY KEY=UnDirected]: ';
strg = input(prompt,'s');
prompt = 'How Many Vertices?\n ';
no_of_vertices = input(prompt);
nov=no_of_vertices;
for i=1:nov
    for j=1:no_of_vertices
        D(i,j)=0;
    end
end
edge_start=[];
s=[];
t=[];
psize=20;
graph_edge=[];
edge_connected=[];
edge_weight=[];
edges=0;
prompt = 'create edges ';
while edges<(no_of_vertices*(no_of_vertices-1))
    prompt = 'enter first node';
    first_node=input(prompt);
    prompt = 'enter connected node';
    second_node=input(prompt);
    prompt = 'enter weight';
    weight=input(prompt);
    if first_node<1 || first_node>no_of_vertices || second_node<1 || second_node>no_of_vertices || first_node==second_node  
        disp( 'enter valid edges')
        continue;
    end
    edge_start=[edge_start;first_node];
    s=[s first_node];
    edge_connected=[edge_connected;second_node];
    t=[t second_node];
    edge_weight=[edge_weight;weight];
    graph_edge=[graph_edge weight];
    edges=edges+1;
    D(first_node,second_node)=weight;
    prompt = 'Do you want more edges? YES/NO [y/ANY KEY]: ';
    str = input(prompt,'s');
    if str=='y'
        continue;
    else
        break;
    end
end
for i=1:nov
    D(i,i)=0;
end
if strg=='d'
    G=digraph(s, t,graph_edge);
else
    G=graph(D);
end
plot(G,'EdgeLabel',G.Edges.Weight);
prompt = 'enter source vertex?\n ';
src = input(prompt);
prompt = 'enter destination vertex?\n ';
dest = input(prompt);

prompt = 'enter Max iteration for genetic algo?\n ';
max = input(prompt);

tic
modified_ga_new(no_of_vertices,psize,src,dest,edge_start, edge_connected, edge_weight,edges,G,max);
timeElapsed_GA = toc

tic
bellman(no_of_vertices,src,dest,edges,edge_start, edge_connected, edge_weight,G);
timeElapsed_bellman = toc

tic
Dijkstra(no_of_vertices,src,dest,G,D);
timeElapsed_dijkstra = toc


tic
johnson(no_of_vertices,src,dest,edges,edge_start, edge_connected, edge_weight,G,D);
timeElapsed_johnson = toc


tic
fw(no_of_vertices,src,dest,G,D);
timeElapsed_floydWarshall = toc

end
