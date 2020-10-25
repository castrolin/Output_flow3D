% Flow3D output file
% Target:ouput the file and replot the figure and compare to the Flowsight
% cross section
% @Editor: Castro
% Date: 10/25
% Note:
clc
clear,close all
%%
% the data and output setting
cross_section_X_position = 0.085000000900000;
filename = 'testdata.xlsx';
s_bottom = textscan(fopen('bottom109.txt','r'),'%n %n %n %n','Delimiter',',');
s_top = textscan(fopen('data109.txt','r'),'%n %n %n %n','Delimiter',',');


%%
X_bottom = s_bottom{1,1};
Y_bottom = s_bottom{1,2};
Z_bottom = s_bottom{1,3};
T_bottom = s_bottom{1,4};

X_top = s_top{1,1};
Y_top = s_top{1,2};
Z_top = s_top{1,3};
T_top = s_top{1,4};

%% Bottom
n =1;
for index = 1:size(X_bottom,1)
    if X_bottom(index) == cross_section_X_position   % the x-dir location 
        index_mat_bo(n) = index;
        n =n+1;
    end
end
% cross section data extract (Bottom)
for n = 1: size(index_mat_bo,2)
    Y_cross_bo(n) = Y_bottom(index_mat_bo(1,n));
    Z_cross_bo(n) = Z_bottom(index_mat_bo(1,n));
    T_cross_bo(n) = T_bottom(index_mat_bo(1,n));
end
% plot the 3D crossection with colorbar(Bottom)
figure,
scatter(Y_cross_bo,Z_cross_bo,80,T_cross_bo,'filled');colorbar


%% Top
n =1;
for index = 1:size(X_top,1)
    if X_top(index) == cross_section_X_position   % the x-dir location 
        index_mat_to(n) = index;
        n =n+1;
    end
end


% cross section data extract (Top)
for n = 1: size(index_mat_to,2)
    Y_cross_to(n) = Y_top(index_mat_to(1,n));
    Z_cross_to(n) = Z_top(index_mat_to(1,n));
    T_cross_to(n) = T_top(index_mat_to(1,n));
end
% plot the 3D crossection with colorbar(Top)
figure,
scatter(Y_cross_to,Z_cross_to,80,T_cross_to,'filled');colorbar
%caxis([293,1500])


%% Total file
Y_cross = [Y_cross_to';Y_cross_bo'];
Z_cross = [Z_cross_to';Z_cross_bo'];
T_cross = [T_cross_to';T_cross_bo'];
figure,
scatter(Y_cross,Z_cross,80,T_cross,'filled');colorbar
%% Export the excel file

xlswrite(filename,Y_cross,1,'A1')
xlswrite(filename,Z_cross,1,'B1')
xlswrite(filename,T_cross,1,'C1')













