function Dijkstra(no_of_vertices,source,dest,G,D)
 figure('name','Dijkstra Algorithm');
 dg=plot(G,'EdgeLabel',G.Edges.Weight);
 hold on;
%     prompt = 'How Many Vertices?\n ';
%     no_of_vertices = input(prompt);
%     nov=no_of_vertices;
%     s=[];
%     t=[];
%     edges=0;
%     graph_edge=[];
%     for i=1:nov
%         for j=1:no_of_vertices
%             D(i,j)=0;
%         end
%     end
%     
%     while edges<(no_of_vertices*(no_of_vertices-1))
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
%     end
%     
%     for i=1:nov
%         D(i,i)=0;
%     end
%     disp(D);
%     disp('hiiiiiiiiiii');
%     G=graph(D);
%     pl=plot(G,'EdgeLabel',G.Edges.Weight);
%     hold on;
%     
%     prompt = 'enter source vertex?\n ';
%     source = input(prompt);
% 
%     prompt = 'enter destination vertex?\n ';
%     dest = input(prompt);
    n=size(D,1); 
    o=n;
    
    for i=1:n
        dist(i)=intmax;
        prev(i)=-1;
        selected(i)=0;
    end
    
    selected(source)=1;
    dist(source)=0;
    start=source;
     extracted=[];
   while sum(selected)~=n
        m=source;
        for i=1:n
            if D(start,i)~=0
                d=dist(start) + D(start,i);
                if(d<dist(i)&& selected(i)==0)
                    dist(i)=d;
                    prev(i)=start;
                    extracted=[extracted d];
                end
%                 if(min>=dist(i) && selected(i)==0 )
%                     min=dist(i);
%                     m=i;
%                 end
            end
            
        end
        minval=min(extracted);
        m=find(minval==dist);
        if length(m)>1
            for i=1:n
                if selected(i)~=1
                    m=i;
                end
            end
        end
        midx=find(extracted==min(extracted));
        selected(start)=1;
        start=m;
        extracted(midx)=[];
    end
    start=dest;
    j=1;
%     
%     while true
%         path(j)=start;
%         j=j+1;
%         start=prev(start);
%         
%        if(start==-1)
%            break;
%        end
%     end
%     path=fliplr(path);
%     disp(path);
% 
%     
%    for i=1:j-2
%          highlight(pl,[path(i) path(i+1)],'EdgeColor',[1 0 0]);
%    end
%  
    minimal_cost=0;
    while true
        path(j)=start;
        j=j+1;
        start=prev(start);
        
       if(start==-1)
           break;
       end
       
    end
    path=fliplr(path);
    

    for i=1:j-2
         minimal_cost=minimal_cost+D(path(i),path(i+1));
         highlight(dg,[path(i) path(i+1)],'EdgeColor',[1 0 0]);
    end
   minimal_cost
   disp('Path:');
   disp(path);
end
