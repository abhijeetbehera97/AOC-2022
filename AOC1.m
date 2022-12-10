close 
clc
clear

% Problem 1

lines = readlines('input1.txt');
count_cal = [];
sum_cal = 0;

for i=1:length(lines)

    if (~isempty(lines{i,1}))
      sum_cal=sum_cal+str2double(lines{i,1});
    else
      count_cal(end+1)=sum_cal;
      sum_cal=0;
    end

end

 if count_cal > 0
        count_cal(end+1) = sum_cal;
 end

fprintf('Part One: %u\n', max(count_cal));


% Problem 2
count_cal = sort(count_cal);
fprintf('Part Two: %u\n',sum(count_cal(end-2:end)));