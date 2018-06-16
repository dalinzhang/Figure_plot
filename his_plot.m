%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot histogram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;

file_name = "./data/multiple-flatten-trial_right_2.xlsx";
[query, header_] = xlsread(file_name,'query');

h_q = histogram(query,'facealpha',.5 );
h_q.FaceColor = [0 0.5 0.5];
h_q.BinWidth = 1;
h_q.EdgeColor = 'none';

xlim([0 200])
ylim([0 0.02])

% set X/Y Tick font style 
set(gca, 'FontWeight','Bold','fontsize',30)

% set X/Y Tick font range and step
set(gca, 'XTick', (0:40:200)); % min:step:max
set(gca, 'YTick', (0:0.005:0.02)); % min:step:max

xlabel("Normalized Relative Reconstruction Error",'FontSize', 30,'FontWeight','bold');
ylabel("Desity",'FontSize',40,'FontWeight','bold')

grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot normalizated histogram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;

file_name = "./data/multiple-flatten-trial_right_2.xlsx";
[query, header_] = xlsread(file_name,'query');

h_q = histogram(query,'facealpha',.5 );
h_q.FaceColor = [0 0.5 0.5];
h_q.Normalization = 'probability';
h_q.BinWidth = 1;
h_q.EdgeColor = 'none';

xlim([0 200])
ylim([0 0.02])

% set X/Y Tick font style 
set(gca, 'FontWeight','Bold','fontsize',30)

% set X/Y Tick font range and step
set(gca, 'XTick', (0:40:200)); % min:step:max
set(gca, 'YTick', (0:0.005:0.02)); % min:step:max

xlabel("Normalized Relative Reconstruction Error",'FontSize', 30,'FontWeight','bold');
ylabel("Desity",'FontSize',40,'FontWeight','bold')

grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot multiple histogram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;

file_name = "./data/multiple-flatten-trial_right_2.xlsx";
[query, header_] = xlsread(file_name,'query');
[eye_open, header__] = xlsread(file_name, 'eye_open', 'A2:A529649');
[eye_close, header] = xlsread(file_name, 'eye_close', 'A2:A529729');
[noise, head] = xlsread(file_name, 'noise', 'A2:A529729');

map = brewermap(3,'Set1'); 

eye_open = (eye_open - mean(query))/mean(query);
eye_close = (eye_close - mean(query))/mean(query);
query = (query - mean(query))/mean(query);


h_q = histogram(query,'facecolor',map(1,:),'facealpha',.5 );
hold on
h_o = histogram(eye_open, 'facecolor',map(2,:),'facealpha',.5);
hold on
h_c = histogram(eye_close, 'facecolor',map(3,:),'facealpha',.5);
hold on


h_q.Normalization = 'probability';
h_q.BinWidth = 0.01;
h_q.EdgeColor = 'none';

h_o.Normalization = 'probability';
h_o.BinWidth = 0.01;
h_o.EdgeColor = 'none';


h_c.Normalization = 'probability';
h_c.BinWidth = 0.01;
h_c.EdgeColor = 'none';

clear all

xlim([0 200])
ylim([0 0.02])

% set X/Y Tick font style 
set(gca, 'FontWeight','Bold','fontsize',30)

% set X/Y Tick font range and step
set(gca, 'XTick', (0:40:200)); % min:step:max
set(gca, 'YTick', (0:0.005:0.02)); % min:step:max

xlabel("Normalized Relative Reconstruction Error",'FontSize', 30,'FontWeight','bold');
ylabel("Desity",'FontSize',40,'FontWeight','bold')

% set legend
legend('query relevant','query eye open','query eye close','location','northeast')
legend boxoff

grid on
