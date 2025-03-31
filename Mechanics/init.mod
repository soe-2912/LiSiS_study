units		metal

boundary		p p p
dimension	3
atom_style	charge

pair_style      buck/coul/long 8.0 12.0
read_restart 	file_restart_2300.dat

mass		1 32.065
mass		2 28.085
mass		3 6.941

set type 1 charge -1.2 
set type 2 charge 2.4
set type 3 charge 0.6

change_box all triclinic

compute peratom all pe/atom

timestep	0.001
