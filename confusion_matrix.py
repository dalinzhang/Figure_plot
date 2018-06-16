#! /usr/bin/python
'''
plot confusion matrix 
'''
import seaborn as sn
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

pamap2_cm = np.array([[87.44444444444444, 0.0, 0.0, 5.037037037037037, 0.0, 1.5185185185185185],
          [0.0, 77.90654205607477, 0.0, 4.0, 0.2616822429906542, 17.83177570093458],
          [0.0, 2.317073170731707, 89.51219512195122, 2.9878048780487805, 0.3048780487804878, 4.878048780487805],
          [0.0, 2.4634146341463414, 1.27100271002710025, 90.79674796747967, 0.3794037940379404, 5.089430894308943],
          [0.0, 3.943661971830986, 3.1690140845070425, 15.56338028169014, 65.07042253521126, 12.253521126760564],
          [0.2803738317757009, 5.88785046728972, 9.345794392523365, 10.373831775700934, 1.7757009345794392, 72.33644859813084]])

pamap2_cm[0]=pamap2_cm[0]/sum(pamap2_cm[0])
pamap2_cm[1]=pamap2_cm[1]/sum(pamap2_cm[1])
pamap2_cm[2]=pamap2_cm[2]/sum(pamap2_cm[2])
pamap2_cm[3]=pamap2_cm[3]/sum(pamap2_cm[3])
pamap2_cm[4]=pamap2_cm[4]/sum(pamap2_cm[4])
pamap2_cm[5]=pamap2_cm[5]/sum(pamap2_cm[5])

'''
"sitting&standing" is to long, so add \n to convert to two-line label
'''
df_cm = pd.DataFrame(pamap2_cm, index = [i for i in ["lying","sitting&\nstanding","cycling","walking","running","others"]], columns = [i for i in ["lying","sitting&\nstanding","cycling","walking","running","others"]])

f=plt.figure(figsize = (100,76))

ax=sn.heatmap(df_cm, annot=True, annot_kws={"size":230, 'weight': 'bold'}, cbar=False, cmap="Blues", vmin=0, vmax=1)

for label_x in ax.get_xticklabels():
	label_x.set_weight("bold")
	label_x.set_color("black")
	label_x.set_rotation(90)
	label_x.set_size(180)

for label_y in ax.get_yticklabels():
	label_y.set_weight("bold")
	label_y.set_color("black")
	label_y.set_rotation(0)
	label_y.set_size(180)


plt.show()
f.savefig('/home/dadafly/program/GitHub/Figure_plot/pamap2_new_cm.png')
