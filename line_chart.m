%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot multiple line chart
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;

record_auto_right = load("/home/dadafly/program/18ICDM/result/multiple-flatten-trial_right_f1.mat");
record_pca_right = load("/home/dadafly/program/18ICDM/result/pca/multiple-flatten-trial_right_f1.mat");
record_dict_right = load("/home/dadafly/program/18ICDM/result/dict/multiple-flatten-trial_right_f1.mat");

threshold = -1:1:30;

f_plot_auto	= plot(threshold, record_auto_right.f1,'-*', 'MarkerSize',15, 'DisplayName', 'Auto-encoder','LineWidth',3);

hold on

f_plot_pca 	= plot(threshold, record_pca_right.f1,'--o', 'MarkerSize',15, 'DisplayName', 'Subspace Projection','LineWidth',3);

hold on

f_plot_dict	= plot(threshold, record_dict_right.f1,'-.', 'MarkerSize',15, 'DisplayName', 'Dictionary Learning','LineWidth',3);


ylabel('F1 Score','FontSize',40,'FontWeight','bold');
xlabel('Threshold','FontSize',40,'FontWeight','bold');

xlim([-1, 30]) % set X axis limitation
ylim([0, 1]) % set X axis limitation

set(gca, 'FontSize',35,'FontWeight','bold','linewidth',2); % set axes style

set(gca, 'XTick', (-1:5:30)); % min:step:max
set(gca, 'YTick', (0:0.25:1)); % min:step:max

grid on

% set legend
lgd =legend([]);
lgd.Box = 'on';

box on
lgd.LineWidth = 1.5;
lgd.FontSize = 25;
lgd.FontWeight = 'bold';

hold off;
