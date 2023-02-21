% training data for the occasionally dishonest casino
% b1 = string of die rolls
% h1 = sequence of hidden states. 1=fair, 2=loaded
b1 = [6,4,3,4,3,1,2,1,2,2,3,1,6,6,3,3,4,6,4,2,6,4,3,5,1,...
    2,6,6,6,1,3,4,6,1,1,2,6,6,6,5,4,2,4,5,2,1,2,2,3,4];
h1 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,...
    2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1];

% die rolls generated by unknown sequence of hidden states
b2 = [2,2,6,1,3,2,6,5,6,3,6,6,1,6,6,1,6,6,6,2,4,6,6,4,...
    5,3,3,5,1,1,2,3,5,5,1,3,4,3,4,4,2,3,1,6,2,1,3,2,3,3];
 
