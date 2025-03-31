variable exx equal 1
variable eyy equal 1
variable ezz equal 1
variable exy equal 0
variable exz equal 0
variable eyz equal 0

clear
box tilt large
read_restart restart.equil
include potential.mod

if "${dir} == 1" then &
   "variable exx equal 1.001" 
if "${dir} == 2" then &
   "variable eyy equal 1.001" 
if "${dir} == 3" then &
   "variable ezz equal 1.001" 
if "${dir} == 4" then &
   "variable exy equal 0.1" 
if "${dir} == 5" then &
   "variable exz equal 0.1" 
if "${dir} == 6" then &
   "variable eyz equal 0.1" 

variable exxr equal (lx-${L0x})/${L0x}
variable eyyr equal (ly-${L0y})/${L0y}
variable ezzr equal (lz-${L0z})/${L0z}
variable exyr equal xy/${L0y}
variable exzr equal xz/${L0z}
variable eyzr equal yz/${L0z}

thermo_style custom temp etotal press v_exxr pxx v_eyyr pyy v_ezzr pzz v_exyr pxy v_exzr pxz v_eyzr pyz 

variable i loop 70
label extendloop

change_box all triclinic &
x scale ${exx}  y scale ${eyy} z scale ${ezz} &
xy delta ${exy} xz delta ${exz} yz delta ${eyz} &
remap

dump 1 all custom 1000 md.lammpstrj id x y z
dump_modify 1 append yes
min_style cg
minimize 1.0e-10 1.0e-10 ${maxiterations} ${maxiterations}

run 2000

run 2000
undump 1
next i
jump displace.mod extendloop

variable i delete