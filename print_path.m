function print_path(i,p)
   if p(i)==-1
       disp(i);
       return;
   else
       print_path(p(i),p);
       disp(i);
   end
     
end