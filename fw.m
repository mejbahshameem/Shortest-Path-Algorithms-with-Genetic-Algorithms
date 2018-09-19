function fw(no_of_vertices,source,dest,G,D)
figure('name','Floyd Warshall Algorithm');
 dg=plot(G,'EdgeLabel',G.Edges.Weight);
 hold on;
%    D=[0 4 0 0 0 0 0 8 0;
% 	 4 0 8 0 0 0 0 11 0;
% 	 0 8 0 7 0 4 0 0 2;
% 	 0 0 7 0 9 14 0 0 0;
% 	 0 0 0 9 0 10 0 0 0;   
% 	 0 0 4 14 10 0 2 0 0;
% 	 0 0 0 0 0 2 0 1 6;
% 	 8 11 0 0 0 0 1 0 7;
% 	 0 0 2 0 0 0 6 7 0;];
%     D=[0     3     4     2     0     0;
%      3     0     4     0     2     0;
%      4     4     0     0     6     0;
%      2     0     0     0     1     4;
%      0     2     6     1     0     2;
%      0     0     0     4     2     0;]
%     prompt = 'How Many Vertices?\n ';
%     no_of_vertices = input(prompt);
%     nov=no_of_vertices;
%     
%     for i=1:nov
%         for j=1:no_of_vertices
%             D(i,j)=0;
%         end
%     end
%     
%     s=[];
%     t=[];
%     edges=0;
%     graph_edge=[];
%     
%      while edges<(no_of_vertices*(no_of_vertices-1))
%         prompt = 'enter first node';
%         first_node=input(prompt);
%         prompt = 'enter connected node';
%         second_node=input(prompt);
%         prompt = 'enter weight';
%         weight=input(prompt); 
%         if first_node<1 || first_node>no_of_vertices || second_node<1 || second_node>no_of_vertices || first_node==second_node  
%             disp( 'enter valid edges')
%             continue;
%         end
%         s=[s first_node];
%         t=[t second_node];
%         graph_edge=[graph_edge weight];
%         edges=edges+1;
%         D(first_node,second_node)=weight;
%         prompt = 'Do you want more edges? YES/NO [y/ANY KEY]: ';
%         str = input(prompt,'s');
%         if str=='y'
%             continue;
%         else
%             break;
%         end
%      end
%      
%     G=digraph(s,t,graph_edge);
%     pl=plot(G,'EdgeLabel',G.Edges.Weight);
%     hold on;
 
    M=D;
    for i=1:size(D,1)
        for j=1:size(D,1)
            if i~=j && M(i,j)==0
                M(i,j)=intmax;
            end
            
        end
    end
    
    n=size(D,1);
    for i=1:n
        for j=1:n
            if(i==j)
                path(i,j)=i;
            else
                path(i,j)=j;
            end
            
        
        end
    end
    
    n=size(D,1);
    for k=1:n
        
            for i=1:n
                for j=1:n   
                        if(M(i,j)>M(i,k)+M(k,j))
                        M(i,j)=min( M(i,k)+M(k,j));
                        path(i,j)=path(i,k);
                        end   
                    end
                    
                end
    end
       
%     disp(M);
%     prompt = 'enter source vertex?\n ';
%     source = input(prompt);
% 
%     prompt = 'enter destination vertex?\n ';
%     dest = input(prompt);
    index=2;
    Npath(1)= source;
    minimal_cost=0;
    while 1==1
        Npath(index)= path(source,dest); 
        if(Npath(index)~=dest)
            source=Npath(index);
            index=index+1;
        else
            break;
        end
        
    end
     
    n=size(Npath,2);
    for i=1:n-1
         minimal_cost=minimal_cost+D(Npath(i),Npath(i+1));
         highlight(dg,[Npath(i) Npath(i+1)],'EdgeColor',[1 0 0]);
    end
    minimal_cost
    disp('Path:');
    disp(Npath);
end