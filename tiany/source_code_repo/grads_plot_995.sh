
#! /bin/bash

grads='/data/software/GrADS-2.2.1/source/grads-2.2.1/bin/grads -d X11 -h GD'
# plot all variables of 995 output, both new and old model runs

for var in patchnum IPARdir IPARdif coszen pft n lai heightm leaf froot wood surfmet surfstr \
soilmet soilstr cwd surfmic soilmic slow passive C_fol C_w C_froot C_root C_lab C_repro TRANS_SW \
Ci GPP Rauto Soilresp NPP CO2flux GCANOPY IPP senescefrac Sacclim c_total c_growth litter betad timecum; do

echo $var
$grads -bl <<EOF
open /data/yudong/GISS/ModelE_Support/huge_space/rd_lsm_ent_harvard_plumber2/995.ctl
open 995.ctl
set grads off
set cmark 0
set gxout line
set t 1 340000
d $var
set cmark 0
d ${var}.2
cbar_l -x 9 -y 7.5 -n 2 -t "Old" "New"
printim compare/$var.gif gif white x1200 y800
quit
EOF

done

