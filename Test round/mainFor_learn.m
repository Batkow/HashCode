clc
data =importdata('learn_and_teach.in');
array = [];
hashtag = 35;
dot = 46;
nRows = 158;

nCols = 800;
for i = 1:nCols
  for j = 1:nRows
    array(j,i) = data{j,1}(i);
  end
end

idx =  array==hashtag;
array = zeros(nRows,nCols);
array(idx) = 1;



fileID = fopen('learnCommands.txt','w');
rows = nRows;
cols = nCols;
maskWidth = 19;
command = 0;
%%
while (maskWidth >=5) 
  for ( row = maskWidth+1 : rows - maskWidth -1)
    for ( col = maskWidth+1 : cols - maskWidth -1)
      subArray = array(row-maskWidth:row+maskWidth, col-maskWidth:col+maskWidth);
      if ( numel(find(subArray==1)) == (maskWidth*2+1)^2) 
        command = command +1;
        array(row-maskWidth:row+maskWidth, col-maskWidth:col+maskWidth) = 5;
        fprintf(fileID,'PAINT_SQUARE %d %d %d\n',row-1,col-1,maskWidth);
        break;
      end
    end
  end
  maskWidth = maskWidth - 1;
end

command
     
close all
imshow(array,[])  

%%
for (row = 1:nRows)
  for (col = 1:nCols)
    if (array(row,col) == 1)
      command = command +1;
      
      verticalArray = array(row,col:end);
      indexVertical = find(verticalArray == 0);
      if (isempty(indexVertical))
        indexVertical = nCols-col+1;
      else
        indexVertical = indexVertical(1)-1;
      end
      lengthVertical = indexVertical-1;
      
      horizontalArray = array(row:end,col);
      indexHorizontal = find(horizontalArray == 0);
       if (isempty(indexHorizontal))
        indexHorizontal = nRows-row+1;
       else
        indexHorizontal =indexHorizontal(1)-1;
       end
      lengthHorizontal = indexHorizontal-1;
      
      verticalNrPainted = sum(array(row,col:col+lengthVertical)==1);
      horizontalNrPainted = sum(array(row:row+lengthHorizontal,col)==1);
      
      if (horizontalNrPainted < verticalNrPainted)
        array(row,col:col+lengthVertical)=5;
        fprintf(fileID,'PAINT_LINE %d %d %d %d\n',row-1,col-1,row-1,col-1+lengthVertical);
      else
       array(row:row+lengthHorizontal,col)=5;
       fprintf(fileID,'PAINT_LINE %d %d %d %d\n',row-1,col-1,row-1+lengthHorizontal,col-1);
      end
    end
    
    
  end
end
command
close all
imshow(array,[])  

