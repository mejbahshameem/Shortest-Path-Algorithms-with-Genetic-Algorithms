function modified_ga(no_of_vertices,psize,src,dest,edge_start, edge_connected, edge_weight,edges,G,max)
figure('name','Genetic Algorithm');
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
%     dg=plot(G,'EdgeLabel',G.Edges.Weight);
%     hold on;
% else
%     G=graph(D);
%     dg=plot(G,'EdgeLabel',G.Edges.Weight);
%     hold on;
% end
% prompt = 'enter source vertex?\n ';
% src = input(prompt);
% prompt = 'enter destination vertex?\n ';
% dest = input(prompt);
% 
p=[];
for i=1:psize
    pnodes=randi(no_of_vertices-2);
         p{i} =[randsample(setdiff(1:no_of_vertices, [src,dest]), pnodes)];
    
end  

  t=0;
  minimal_cost=intmax;
  arr1=[];
  arr2=[];
  while(t<max)
       pc=crossOver(p,psize);%%%crossover done
       pm=mutation(p,psize,src,dest,no_of_vertices);
       [p,mincost]=Select(p,pc,pm,psize,edge_start, edge_connected, edge_weight,src,dest,no_of_vertices);
       [j k]=min(mincost);
       minpath=cell2mat(p(k));
       minpath=[src,minpath,dest];
       if j<minimal_cost
            minimal_cost=j;
            arr1=[j];
            arr2=[minpath];
        end

       t=t+1;
  end
    minimal_cost
    disp('Path:');
    disp(minpath);
    
    n=size(minpath,2);
    for i=1:n-1
         highlight(dg,[minpath(i) minpath(i+1)],'EdgeColor',[1 0 0]);
    end
    
    