function prac
s=[1 2 3]
t=[2 3 3]
names={'a','b','c'};
w=[3 10 12]
d=digraph(s,t,w,names);
p=plot(d);
p.EdgeColor='red';
end