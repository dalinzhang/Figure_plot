%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot multiple bar chart
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all;
% 
% file_name = "/home/dadafly/Doc/draft/CIKM_2018/auc_sub.xlsx";
% [data, header] = xlsread(file_name);
% 
% train_proportion = data(:,1);
% test_accuracy	 = data(:,2);
% max_v			 = data(:,3);
% min_v			 = data(:,4);
% 
% figure;
% hold on;
% 
% h = bar(categorical(train_proportion), [min_v, test_accuracy, max_v], 'EdgeAlpha',0, 'BarWidth', 1); % EdgeAlpha sets the box line of the bar; BarWidth sets the width of the bar
% ylim([0 1])
% 
% % color of the bar chart
% colormap(summer(9)); 
% 
% % set the legend
% l = cell(1,3);
% l{1}='Min'; l{2}='Average'; l{3}='Max';   
% lgd = legend(h,l, 'Box', 'on');
% lgd.FontSize=35;
% 
% ylabel('Area Under ROC Curve','FontSize',50,'FontWeight','bold');
% xlabel('Number of Training Subjects ','FontSize',30,'FontWeight','bold');
% set(gca,'FontSize',40,'FontWeight','bold','linewidth',2);
% 
% box on
% grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot bar chart with errorbar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;

file_name = "/home/dadafly/Doc/draft/CIKM_2018/auc_sub.xlsx";
[data, header] = xlsread(file_name);

train_proportion = data(:,1);
test_accuracy	 = data(:,2);
max_v			 = data(:,3);
min_v			 = data(:,4);

figure;
hold on;

h = bar(categorical(train_proportion), [test_accuracy], 'EdgeAlpha',0, 'BarWidth', 0.3); % EdgeAlpha sets the box line of the bar; BarWidth sets the width of the bar
ylim([0 1])

colormap(summer(9)); % color of the bar chart

e = errorbar(categorical(train_proportion),(max_v+min_v)/2,(max_v-min_v)/2);
e.LineWidth = 3;
e.Color = [1, 0.45, 0];
e.CapSize = 20;
e.LineStyle = 'none'

ylabel('Area Under ROC Curve','FontSize',50,'FontWeight','bold');
xlabel('Number of Training Subjects ','FontSize',30,'FontWeight','bold');
set(gca,'FontSize',40,'FontWeight','bold','linewidth',2);

box on
grid on
