#!/bin/bash
i=0
j=0
k=0
echo "cetus compilation"
for f in *.c; 
do 
	echo "Processing $f file..";
	/home/saranya/Dokument/courses/research-methodology/module2/cetus/cetus-1.4.4/bin/cetus -normalize-loops -teliminate-branch=1 -tsingle-call -tsingle-declarator -tsingle-return $f;
done
echo "cil compilatiom"
for f in *.c; 
do 
	echo "Processing $f file..";
	/home/saranya/Dokument/cil/bin/cilly --gcc=/usr/bin/gcc-5 --save-temps=cil_output $f
done
echo "******summary*******"
for f in *.c; 
do 
	let "i++"
done
echo "total number processed: $i"
for f in cetus_output/*.c; 
do 
	let "j++"
done
echo "cetus number compiled: $j"
cd cil_output;
rm *.o;
rm *.i;
cd ..
for f in cil_output/*.c; 
do 
	let "k++"
done
echo "cil number compiled: $k"

#cd /home/saranya/Dokument/courses/research-methodology/module2/cetus/gcc-4.2.1/gcc
#echo "gcc test run"
#runtest --tool gcc --srcdir ./testsuite gcc.c-torture/execute/ieee/ieee.exp
#echo "cetus test run"
#runtest --tool gcc --srcdir ./testsuite gcc.c-torture/execute/ieee/cetus_output/ieee.exp
#echo "cil test run"
#runtest --tool gcc --srcdir ./testsuite gcc.c-torture/execute/ieee/cil_output/ieee.exp



