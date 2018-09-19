function value=getQuality(a,edge_start, edge_connected, edge_weight,src,dest)
   value=0;
   ba=[1 3 8 14 20];
   a=[src,a(1:end),dest];
    if isequal(a,ba)==1
        disp('hiiiiiiiiiiiii')
        
        
    end
   i=1;
   while(i<=size(a,2)-1)
       j=i+1;
       match=find(a(i)==edge_start);
       match2=find(a(j)==edge_connected);
       if isempty(match)~=1 && isempty(match2)~=1
          if isempty(intersect(match,match2))==1
            value=value+intmax;
            break;
          else
              idx=intersect(match,match2);
              value=value+edge_weight(idx);
          end
%             if size(match,1)<size(match2,1)
%                  len=size(match,1);
%             else
%                  len=size(match2,1);
%             end
%             c=0;
%             for k=1:len
%                cr=edge_connected(match(k));
%                 if isequal(a,ba)==1
%                    len
%                    cr
%                    match
%                    match2
%                    disp(size(match,1));
%                    pause(10);
%                    
%                 end
%                 if cr==a(j)
%                     c=1;
%                     value=value+edge_weight(match(k));
%                     break;
%                 end
%             end
%             if c==0
%                 value=value+intmax;
%                 break;
%             end
       else
            value=value+intmax;
       end
       
      i=i+1;
%       
%       if isequal(a,ba)==1
%         a 
%         i
%         disp(value);
%         disp(c);
%         
%       end
   end
   
end