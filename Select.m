function [s,mincost]=Select(p,pc,pm,psize,edge_start, edge_connected, edge_weight,src,dest,no_of_vertices)
    s={};
    mincost=[];
    visited={};
    r=[];
    k=0;
    r=[p;pc;pm];
    for i=1:psize
        minval=intmax;
        for j=1:size(r,1)
            for k=1:size(r,2)
                if isempty(r(j,k))~=1 
                    a=cell2mat(r(j,k));
                    kl=[2 3];
                    quality=getQuality(a,edge_start, edge_connected, edge_weight,src,dest);
                    if quality<minval
                        minval=quality;
                        rem1=j;
                        rem2=k;
                    end
                end
            end
        
        end
       
        if minval==intmax
            s{i} =[randsample(setdiff(1:no_of_vertices, [src,dest]), randi(no_of_vertices-2))];
            mincost=[mincost;intmax];
        else
            cvtomat=cell2mat(r(rem1,rem2));
            result=0;
            if size(visited,2)~=0
                for j=1:size(visited,2)
                    cvtmat=cell2mat(visited(j));
                    if isequal(cvtmat,cvtomat)==1
                        result=1;
                        break;
                    end
                
                end
            end
            if result==0
                s{i}=cvtomat;
                mincost=[mincost;minval];
                visited{k}=cvtomat;
                k=k+1;
                r{rem1,rem2}=[no_of_vertices+1 no_of_vertices-2];
            else
                s{i} =[randsample(setdiff(1:no_of_vertices, [src,dest]), randi(no_of_vertices-2))];
                mincost=[mincost;getQuality(cell2mat(s(i)),edge_start, edge_connected, edge_weight,src,dest)];
            end
        end
       
    end
end