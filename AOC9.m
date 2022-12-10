close all
clc
clear

lines = readtable('input9.txt');
number=readmatrix('input9.txt');

for i=1:length(lines)
      move(i,1)= lines{i,1}(1);
end

h=[0 0];
t=[0 0];
visited=[0 0];

for i=1:size(move,1)
   for j=1:number(i,2) 
    h(1)=h(1)+(move(i,1)=='R')-(move(i,1)=='L');
    h(2)=h(2)+(move(i,1)=='D')-(move(i,1)=='U');
     if (max(abs(t(1)-h(1)),abs(t(2)-h(2)))==2)
         t(1)= t(1)+(t(1)<h(1))-(t(1)>h(1));
         t(2)= t(2)+(t(2)<h(2))-(t(2)>h(2));          
         visited(end+1,:)=t;
     end
   end
end

fprintf('Part One: %u\n', size(unique(table(visited)),1));

%%


h=[0 0];
t=[0 0];
dummy=zeros(10,2);
visited=dummy(end,:);

for i=1:size(move,1)
   for j=1:number(i,2) 
    dummy(1,1)=dummy(1,1)+(move(i,1)=='R')-(move(i,1)=='L');
    dummy(1,2)=dummy(1,2)+(move(i,1)=='D')-(move(i,1)=='U');
     for m=2:10
       h=dummy(m-1,:);
       t=dummy(m,:);
       if (max(abs(t(1)-h(1)),abs(t(2)-h(2)))==2)
         t(1)= t(1)+(t(1)<h(1))-(t(1)>h(1));
         t(2)= t(2)+(t(2)<h(2))-(t(2)>h(2));          
       end
       dummy(m-1,:)=h;
       dummy(m,:)=t;
     end
      visited(end+1,:)=dummy(end,:);  
   end
end

fprintf('Part Two: %u\n', size(unique(table(visited)),1));
