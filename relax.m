function [d,p]=relax(edge_start,edge_connected,edge_weight,d,p)
    if d(edge_connected)>(d(edge_start)+edge_weight)
        d(edge_connected)=d(edge_start)+edge_weight;
        p(edge_connected)= edge_start;
    end
    
   
end