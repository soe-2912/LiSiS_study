
####################### Force field setup ##############################

pair_style      buck/coul/long 8.0 12.0
kspace_style     pppm 0.00001
pair_coeff      * *  0.0                     1.0             0
pair_coeff      1 1 110000.0  0.284 1000.0
pair_coeff      1 2 80000  0.178 0
pair_coeff      1 3 100000.0  0.182   0
pair_coeff      2 2 2079884.45214  0.072   0
pair_coeff      2 3 5474616.633  0.076   0
pair_coeff      3 3 7020145.65763  0.080   0
neighbor        2.0 bin
neigh_modify    delay 0 every 1 check yes
########################################################################