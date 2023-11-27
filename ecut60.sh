#!/bin/bash


#for i in $(seq 80 10 100)
for i in $(seq 10 10 100)
#for i in 70 80 90 100

do
for j in $(($i*4))
do
mkdir $i
cd $i

cat >  ecut60.in << EOF

 
 &CONTROL
   title           = 'ecut' 
   calculation     = 'scf' 
   restart_mode    = 'from_scratch' 
   outdir          = '/home/brn/ZnONT/nt60/ecut60/$i' 
   wfcdir          = '/home/brn/ZnONT/nt60/ecut60/$i' 
   pseudo_dir      = '/home/brn/pseudopotentials/' 
   prefix          = 'ecut40' 
   verbosity       = 'low' 
 /
 &SYSTEM
   ibrav           = 0
   celldm(1)       = 30.8619885702d0
   nat             = 24
   ntyp            = 2
   ecutwfc         = $i 
   ecutrho         = $j
   input_dft       = 'PBE' 
   occupations     = 'smearing' 
   degauss         = 1.0d-4 
   smearing        = 'mv' 
 /
 &ELECTRONS
   electron_maxstep = 100
   conv_thr        = 1d-06 
   mixing_beta     = 0.5d0 
 /
CELL_PARAMETERS alat 
  1.000000000000d0  0.000000000000d0  0.000000000000d0
  0.000000000000d0  1.000000000000d0  0.000000000000d0
  0.000000000000d0  0.000000000000d0  0.351591323500d0
ATOMIC_SPECIES
    O   15.99940  O.pbe-hgh.UPF 
   Zn   65.40900  Zn.pbe-d-hgh.UPF 
ATOMIC_POSITIONS crystal 
  Zn   0.6938424560d0   0.5000000000d0   0.6666666667d0
   O   0.6678724912d0   0.5969212280d0   0.8333333333d0
   O   0.6938424560d0   0.5000000000d0   0.3333333333d0
  Zn   0.5969212280d0   0.6678724912d0   0.6666666667d0
   O   0.5000000000d0   0.6938424560d0   0.8333333333d0
  Zn   0.6678724912d0   0.5969212280d0   0.1666666667d0
   O   0.5969212280d0   0.6678724912d0   0.3333333333d0
  Zn   0.4030787720d0   0.6678724912d0   0.6666666667d0
   O   0.3321275088d0   0.5969212280d0   0.8333333333d0
  Zn   0.5000000000d0   0.6938424560d0   0.1666666667d0
   O   0.4030787720d0   0.6678724912d0   0.3333333333d0
  Zn   0.3061575440d0   0.5000000000d0   0.6666666667d0
   O   0.3321275088d0   0.4030787720d0   0.8333333333d0
  Zn   0.3321275088d0   0.5969212280d0   0.1666666667d0
   O   0.3061575440d0   0.5000000000d0   0.3333333333d0
  Zn   0.4030787720d0   0.3321275088d0   0.6666666667d0
   O   0.5000000000d0   0.3061575440d0   0.8333333333d0
  Zn   0.3321275088d0   0.4030787720d0   0.1666666667d0
   O   0.4030787720d0   0.3321275088d0   0.3333333333d0
  Zn   0.5969212280d0   0.3321275088d0   0.6666666667d0
   O   0.6678724912d0   0.4030787720d0   0.8333333333d0
  Zn   0.5000000000d0   0.3061575440d0   0.1666666667d0
   O   0.5969212280d0   0.3321275088d0   0.3333333333d0
  Zn   0.6678724912d0   0.4030787720d0   0.1666666667d0    
K_POINTS automatic 
  1 1 5   0 0 0 





EOF

mpirun /usr/local/bin/pw.x -in ecut60.in | tee ecut60_$i.out

cd ..

done
done
exit

