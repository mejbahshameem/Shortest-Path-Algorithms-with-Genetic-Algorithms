function graph_print(i,p,edge,s,r)
    if p(i)==-1
         fprintf('%d\t\t',i);
       return;
    else
          graph_print(p(i),p,edge,s,r)
          highlight(r,[p(i) i],'EdgeColor',[1 0 0]);
          fprintf('%d\t\t',i);
   end
 
   
end