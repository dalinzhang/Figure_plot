clear all;

file_name = "./runtime.xlsx";
[data, header] = xlsread(file_name);

parameter = data(:,1)/1e6;
rtime	  = data(:,2)*1000;

model = categorical({'1D-CNN', '2D-CNN', '3D-CNN','RNN(16)','RNN(64)','Parallel', 'Parallel 3D', 'Cascade', '[15]'});
model = reordercats(model, {'1D-CNN', '2D-CNN', '3D-CNN','RNN(16)','RNN(64)','Parallel', 'Parallel 3D', 'Cascade', '[15]'});

figure;
hold on;

% set axes style
a = get(gca,'TickLabel');
set(gca, 'TickLabel', a, 'fontsize',25,'FontWeight','bold','linewidth',2); 


yyaxis left 
h = bar(model, parameter, 'EdgeAlpha',0, 'BarWidth', 1, 'DisplayName', 'Parameters','FaceColor',[0    0.4470    0.7410]); % EdgeAlpha sets the box line of the bar; BarWidth sets the width of the bar
ylabel('Number of Parameters (Mil)','FontSize',30,'FontWeight','bold');

yyaxis right
l 	= plot(rtime,'--o','MarkerSize',15,'DisplayName', 'Run Time','LineWidth',3);
ylabel('Run Time (ms)','FontSize',30,'FontWeight','bold');

xlabel('Model','FontSize',40,'FontWeight','bold');

% set legend
lgd =legend([]);
lgd.Box = 'on';

box on
lgd.LineWidth = 1.5;
lgd.FontSize = 28;
lgd.FontWeight = 'bold';

box on
grid on
