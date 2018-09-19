function c=crossOver(q,row)
    c=[];
    j=ceil(row/2);
    c1=[];
    c2=[];
    d=1;
    i=0;
    while(i<j)
         r1=randi(row);
         r2=randi(row);
         while(1)
            if r1~=r2
                break;
            else
                r2=randi(row);
            end
         end
         a=cell2mat(q(r1));
         b=cell2mat(q(r2));
         lena=size(a,2);
         lenb=size(b,2);
         if lena<lenb
             len=lena;
         else
             len=lenb;
         end
         if len>0
            point=randi(len);
            count=0;
            while(1)
                check=intersect(a(1:point),b(point+1:end));
                check1=intersect(b(1:point),a(point+1:end));
                if isempty(check)==1 && isempty(check1)==1
                    c1=[a(1:point) b(point+1:end)];
                    c2=[b(1:point) a(point+1:end)];
                    c{d}=c1;
                    c{d+1}=c2;
                    d=d+2;
                    i=i+1;
                    break;
                else
                    point=randi(len);
                    count=count+1;
                    if count==100
                        break;
                    end
                end
             
            end
            
         end
         
    end
   
end