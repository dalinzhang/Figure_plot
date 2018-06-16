import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

data_file = "./data/multiple-flatten-trial_right_2.xlsx"

noise = np.array(pd.read_excel(data_file, 'noise'))
query = np.array(pd.read_excel(data_file, 'query'))
eye_open = np.array(pd.read_excel(data_file, 'eye_open'))
eye_close = np.array(pd.read_excel(data_file, 'eye_close'))

for query in ['eye_open', 'eye_close'] :
	subset = np.array(pd.read_excel(data_file, query))
	sns.distplot(np.squeeze(subset), bins = int(600/1),
                 label = query, hist = True, kde = True,
                 norm_hist=True,
                 kde_kws={'bw': 0.1, 'linewidth': 3},
                 hist_kws = {'edgecolor': 'black'})

plt.legend(prop={'size': 16}, title = 'query')
plt.title('Histogram of errors by query'); plt.xlabel('Errors'); plt.ylabel('Normalized Counts');
plt.xlim(0,200)
plt.show()

