import numpy as np

data = np.load('/home/darkest/WorkDir/GitHub/quickfit/HL3/OUTPUT/kin_data_6521.npz',allow_pickle=True)

data.files

Ti = data['Ti']
aa = data['Ti'].item().keys()
bb = data['Ti'].item()
