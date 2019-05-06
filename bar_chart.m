%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot multiple bar chart
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;

file_name = "./data/auc_sub.xlsx";
[data, header] = xlsread(file_name);

train_proportion = data(:,1);
test_accuracy	 = data(:,2);
max_v			 = data(:,3);
min_v			 = data(:,4);

figure;
hold on;

h = bar(categorical(train_proportion), [min_v, test_accuracy, max_v], 'EdgeAlpha',0, 'BarWidth', 1); % EdgeAlpha sets the box line of the bar; BarWidth sets the width of the bar
ylim([0 1])

% color of the bar chart
colormap(summer(9)); 

% set the legend
l = cell(1,3);
l{1}='Min'; l{2}='Average'; l{3}='Max';   
lgd = legend(h,l, 'Box', 'on');
lgd.FontSize=35;

ylabel('Area Under ROC Curve','FontSize',50,'FontWeight','bold');
xlabel('Number of Training Subjects ','FontSize',30,'FontWeight','bold');
set(gca,'FontSize',40,'FontWeight','bold','linewidth',2);

box on
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot bar chart with errorbar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;

file_name = "./data/auc_sub.xlsx";
[data, header] = xlsread(file_name);

train_proportion = data(:,1);
test_accuracy	 = data(:,2);
max_v			 = data(:,3);
min_v			 = data(:,4);
error            = max_v-min_v;

figure;
hold on;

h = bar(categorical(train_proportion), [test_accuracy], 'EdgeAlpha',0, 'BarWidth', 0.3); % EdgeAlpha sets the box line of the bar; BarWidth sets the width of the bar
ylim([0 1])

colormap(summer(9)); % color of the bar chart

e = errorbar(categorical(train_proportion),test_accuracy, error);
% e = errorbar(categorical(train_proportion),(max_v+min_v)/2,(max_v-min_v)/2);
e.LineWidth = 3;
e.Color = [1, 0.45, 0];
e.CapSize = 20;
e.LineStyle = 'none'

ylabel('Area Under ROC Curve','FontSize',50,'FontWeight','bold');
xlabel('Number of Training Subjects ','FontSize',30,'FontWeight','bold');
set(gca,'FontSize',40,'FontWeight','bold','linewidth',2);

box on
grid on


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot grouped bar chart with errorbar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;


train_proportion = [5, 15, 25, 35, 45, 55, 65, 75, 85, 95];
D_test_acc	 = [0.653714, 0.675490, 0.695550, 0.711570, 0.726206, 0.72587, 0.71726, 0.74793, 0.76992, 0.7636];
D_test_auc	 = [0.699724, 0.729076, 0.757072, 0.780386, 0.789762, 0.79625, 0.77004, 0.82023, 0.84169, 0.8334];

D_acc_err = [0.020633, 0.018282, 0.008818, 0.014892, 0.010217, 0.029617, 0.011185, 0.014168, 0.009081, 0.024447];
D_auc_err = [0.019556, 0.017991, 0.007365, 0.016913, 0.010666, 0.029369, 0.017337, 0.012112, 0.008539, 0.02134];



data = transpose([D_test_auc; D_test_acc]);
error = transpose([D_auc_err;D_acc_err]);

h = bar(train_proportion, data, 'EdgeAlpha',0, 'BarWidth', 1); % EdgeAlpha sets the box line of the bar; BarWidth sets the width of the bar
ylim([0 1]);

% color of the bar chart
colormap(summer(9)); 

% plot error bar
f = @(a)bsxfun(@plus,cat(1,a{:,1}),cat(1,a{:,2})).';
hold on
e = errorbar(f(get(h,{'xoffset','xdata'})),...
    cell2mat(get(h,'ydata')).',error,'.','linewidth',3,'CapSize',20,'LineStyle', 'none');

% set the legend
l = cell(1,2);
l{1}='VG-HAM'; l{2}='DG-HAM';  
lgd = legend(h,l, 'Box', 'on');
lgd.FontSize=35;

ylabel('Accuracy','FontSize',50,'FontWeight','bold');
xlabel('Number of Training Subjects ','FontSize',30,'FontWeight','bold');
set(gca,'FontSize',40,'FontWeight','bold','linewidth',2);

box on
grid on

