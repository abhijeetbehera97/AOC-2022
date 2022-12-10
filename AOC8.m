close all
clc
clear

trees = readlines('input8.txt');

%% Part 1

for i=1:length(trees)
    for j=1:strlength(trees{1,1})
       h(i,j)= str2num(trees{i,1}(j));
    end
end

n= size(h,1);
m= size(h,2);

visible_trees=0;

for i=1:n
    for j=1:m
        if (j==1 || max(h(i,1:j-1)) < h(i,j))
           visible_trees=visible_trees+1;
        elseif (j==m || max(h(i,j+1:m)) < h(i,j) )
           visible_trees=visible_trees+1;
        elseif (i==1  || max(h(1:i-1,j)) < h(i,j))
           visible_trees=visible_trees+1;
        elseif (i==n || max(h(i+1:n,j))< h(i,j))
           visible_trees=visible_trees+1;
        end
    end
end

fprintf('Part One: %u\n', visible_trees);

%% Part 2

scenic_score=0;
direction=[0 1;
           0 -1;
           1 0;
          -1 0];


for i=1:n
    for j=1:m
      score=1;
     for dir=1:size(direction,1)  
        di=direction(dir,1);
        dj=direction(dir,2);
        ii=i+di;
        jj=j+dj;
        dist=0;

      while((ii>=1 && ii<=n) && (jj>=1 && jj<=m) && h(ii,jj)<h(i,j))
       dist=dist+1;
       ii=ii+di;
       jj=jj+dj;

        if((ii>=1 && ii<=n) && (jj>=1 && jj<=m) && h(ii,jj)>=h(i,j))
            dist=dist+1;
        end
      
      end
        score=score*dist;

     end
     
     scenic_score=max(scenic_score,score);

    end
end

fprintf('Part Two: %u\n', scenic_score);