clc, clf

% Import data
%data =importdata('right_angle.in');
%data =importdata('logo.in');
data =importdata('learn_and_teach.in');
array = [];
hashtag = 35;
dot = 46;
%nRows = 40;
%nCols = 200;
%nRows = 14;
%nCols = 80;
nRows = 158;
nCols = 800;
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


tic();

%imshow(array,[])
% Paint, run length wise
nInstructions = 0;
i = 1; j = 1;
while i <= nRows
  while j <= nCols
    if array(i,j) == 1
      j_start = j;
      % Paint!
      while j < nCols && (array(i,j+1) == 1)
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


toc();

subplot(3,1,1)
imshow(array,[])
title('Original')

subplot(3,1,2)
imshow(arrayCopy,[])
title('Painted')
grid on

subplot(3,1,3)
imshow(abs(array-arrayCopy),[])
title('Difference')

fprintf('nr of instructions: %i\n', nInstructions)
fprintf('image diff: %i\n', sum(sum(abs(array-arrayCopy))))
fprintf('cells/instruction: %f\n', sum(sum(array))/nInstructions)


        





