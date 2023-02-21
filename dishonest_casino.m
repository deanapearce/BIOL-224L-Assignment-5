% training data for the occasionally dishonest casino
rng(224); % standardise seed
% b1 = string of die rolls
% h1 = sequence of hidden states. 1=fair, 2=loaded
b1 = [6,4,3,4,3,1,2,1,2,2,3,1,6,6,3,3,4,6,4,2,6,4,3,5,1,2,6,6,6,1,3,4,6,1,1,2,6,6,6,5,4,2,4,5,2,1,2,2,3,4];
h1 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1];
%split into fair and loaded arrays
b1_prav = [];
b1_neprav = [];
for i = 1:length(b1)
    switch h1(1,i)
        case 1
            b1_prav = [b1_prav,b1(i)];
        case 2
            b1_neprav = [b1_neprav,b1(i)];
        otherwise
            assert(false)
    end
end
%split h1 into dimers
h1_dimers = cell(1,length(h1)-1);
for i = 1:length(h1)-1
    h1_dimers{i} = [h1(1,i),h1(1,i+1)];
end
%split b1 into dimers
%b1_dimers = cell(1,length(b1));
%for i = 1:length(b1)-1
%    b1_dimers{i} = {b1(1,i),b1(1,i+1)};
%end
% die rolls generated by unknown sequence of hidden states
b2 = [2,2,6,1,3,2,6,5,6,3,6,6,1,6,6,1,6,6,6,2,4,6,6,4,5,3,3,5,1,1,2,3,5,5,1,3,4,3,4,4,2,3,1,6,2,1,3,2,3,3];

%pseudoemission calcs
[b1_prav_counts,b1_prav_elements] = groupcounts(transpose(b1_prav));
[b1_neprav_counts,b1_neprav_elements] = groupcounts(transpose(b1_neprav));
%pseudotransmission calcs
h1_dimers_mat = cell2mat(transpose(h1_dimers));
h1_dimers_mat_cat = strcat(string(h1_dimers_mat(:,1)),string(h1_dimers_mat(:,2)));
[h1_dimers_counts,h1_dimers_elements] = groupcounts(h1_dimers_mat_cat);

[P,E] = hmmestimate(b1,h1,...
    'Pseudotransitions',...
        [h1_dimers_counts(1),h1_dimers_counts(2);h1_dimers_counts(4),h1_dimers_counts(3)]+1,... %[f->f,f->l;l->l;l->f] (+1 to all for L)
        'Pseudoemissions',...
        [transpose(b1_prav_counts);transpose(b1_neprav_counts)]+1); %[count of 1,2,3,4,5,6 for fair; count of 1,2,3,4,5,6 for loaded] (+1 to all for L)