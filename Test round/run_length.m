clc, clf

% Import data
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

% Reshape to 0 and 1
indx = array == hashtag;
array = false(nRows,nCols);
array(indx) = 1;
arrayCopy = zeros(nRows, nCols);
%imshow(array,[])

% Paint, run length wise
nInstructions = 0;
i = 1; j = 1;
while i < nRows
  while j < nCols
    if array(i,j) == 1
      disp('Working')
      j_start = j;
      % Paint!
      while (array(i,j+1) == 1) && j < nCols
        j = j + 1;
      end
      arrayCopy(i,j_start:j) = 1;
      nInstructions = nInstructions + 1;
    end
    j = j + 1;
  end
  j = 1;
  i = i + 1;
end

subplot(2,1,1)
imshow(array,[])

subplot(2,1,2)
imshow(arrayCopy,[])

        
        





