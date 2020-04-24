function plotMatrixAndCopyClicks(M)
% M = original matrix, newMatrix = new matrix

rows = numel(M(:,1));
cols = numel(M(1,:));
newMatrix = [];

figure
axes('NextPlot', 'add') % keep adding the next plots on the figure
k = 1;
h = plot(M(k,:),'-','LineWidth',2, 'color',rand(1,3)); % plotting the 1st row of the original matrix while saving the handles in h
set(h,'ButtonDownFcn',{@selectedPlot,h}) % getting the click event


%% function to respond to clicks
function selectedPlot(objH,~,~)
set(objH, 'LineStyle','--'); % change the line style of clicked line to --
data = get(objH,'ydata'); % retrieve data of the selected line
newMatrix(k,1:cols) = data; % store the data retrieved to new matrix
disp('New Matrix: ')
disp(newMatrix);
save('newMatrix.mat','newMatrix') % save the new matrix


k = k+1;
if k<=rows
h = plot(M(k,:),'-','LineWidth',2, 'color',rand(1,3)); % plot the rest of the rows after every click until all the rows of M are exhausted
end
set(h,'ButtonDownFcn',{@selectedPlot,h}) % getting the click event recursively
end

end
