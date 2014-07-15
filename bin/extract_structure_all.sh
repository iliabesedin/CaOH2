#!/bin/bash

CWD=`pwd`;
cd ../results
for i in *; do
    echo "#Pressure(kbar)	a(Bohr)	c(Bohr)	z(O)(Bohr)	z(H)(Bohr)	z(Ca)(Bohr)	Energy	Unit-cell volume	Enthalpy	1e contrib	Hartree contr	XC contrib	Ewald contrib" > ../plot/${i}.data
    for j in $i/*.out; do
#	echo "${CWD}/extract_structure.sh $j >> ../plot/${i}.data";
	${CWD}/extract_structure.sh $j >> ../plot/${i}.data;
    done
done
cd $PWD;