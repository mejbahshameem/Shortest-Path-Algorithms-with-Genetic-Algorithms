function [value,d,p]=bellman_algo(edges,edge_start,edge_connected,edge_weight,d,p)
    value=0;
    for i=1:edges
        [d,p]=relax(edge_start(i),edge_connected(i),edge_weight(i),d,p);
    end
    for i=1:edges
        if d(edge_connected(i))>(d(edge_start(i))+edge_weight(i))
            value=1;
            break;
        end
    end
end