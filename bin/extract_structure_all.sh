#!/bin/bash

CWD=`pwd`;
cd ../results
for i in *; do
    echo "#Pressure(kbar)	a(Bohr)	c(Bohr)	z(O)(Bohr)	z(H)(Bohr)	O-H bonding length (Bohr)" > ../plot/${i}.data
    for j in $i/*.out; do
#	echo "${CWD}/extract_structure.sh $j >> ../plot/${i}.data";
	${CWD}/extract_structure.sh $j >> ../plot/${i}.data;
    done
done
cd $PWD;