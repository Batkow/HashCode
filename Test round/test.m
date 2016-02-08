clc
data =importdata('right_angle.in');
array = [];
hashtag = 35;
dot = 46;
nRows = 40;
nCols = 200;
for i = 1:nCols
  for j = 1:nRows
    array(j,i) = data{j,1}(i);
  end
end

idx =  array==hashtag;
array = zeros(nRows,nCols);
array(idx) = 1;



rows = nRows;
cols = nCols;
maskWidth = 19;
command = 0;

while (~isempty(find(array==1)))
  
  hashTags = find(array==1);
  nElements = numel(hashTags);
  randomElement = randi(nElements);
  [row,col] = ind2sub([nRows,nCols],randomElement);
  
  
    if (array(row,col) == 1)
      
      if(randi(2) == 1)
        while (maskWidth >=3)
        
        minROW = (row - maskWidth-1) >= 1;
        maxRow = (row + maskWidth+1) <= nRows;
        
        minCol = (col - maskWidth-1) >= 1;
        maxCol = (col + maskWidth+1) <= nCols;
        
        if ( minROW && maxRow && minCol && maxCol)
            subArray = array(row-maskWidth:row+maskWidth, col-maskWidth:col+maskWidth);
            if ( numel(find(subArray==1)) == (maskWidth*2+1)^2) 
              command = command +1
              array(row-maskWidth:row+maskWidth, col-maskWidth:col+maskWidth) = 5;
              break;
            end
        end
        maskWidth = maskWidth - 1;
        
        end
      else

      
      
      command = command +1
      verticalArray = array(row,col:end);
      indexVertical = find(verticalArray == 0);
      indexVertical = indexVertical(1)-1;
      lengthVertical = indexVertical;
      
      horizontalArray = array(row:end,col);
      indexHorizontal = find(horizontalArray == 0);
      indexHorizontal =indexHorizontal(1)-1;
      lengthHorizontal = indexHorizontal;
      
      if (lengthHorizontal < lengthVertical)
        array(row,col:col+indexVertical-1)=5;
      else
        array(row:row+indexHorizontal-1,col)=5;
      end
      end
    end
  end
  
command
close all
imshow(array,[])  

