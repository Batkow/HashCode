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


rows = nRows;
cols = nCols;
maskWidth = 19;
while (maskWidth >=1)
  for ( row = maskWidth+1 : rows - maskWidth -1)
    for ( col = maskWidth+1 : cols - maskWidth -1)
      subArray = array(row-maskWidth:row+maskWidth, col-maskWidth:col+maskWidth);
      
      if ( sum(find(subArray==hashtag)) == (maskWidth*2+1)^2) 
        array(row-maskWidth:row+maskWidth, col-maskWidth:col+maskWidth) = 0;
      end
    end
  end
  maskWidth = maskWidth - 1;
end
close all
imshow(array,[])


