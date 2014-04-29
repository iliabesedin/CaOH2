#!/bin/bash

#tail -n 500 ${1} | sed -n '/entering subroutine stress .../,/Writing output data file/ {
#    /entering subroutine stress .../{x;d}
#    H
#  };
#  ${x;p}';
pressure=`tail -n 500 ${1} | sed -n '/entering subroutine stress .../,/Writing output data file/ {
    /entering subroutine stress .../{x;d}
    H
  };
  ${x;p}' | awk 'BEGIN {NLINE=0} {if (NLINE == 2) { pressure=$6; }; ++NLINE }; END {print pressure; }'`;

lattice_information=`cat ${1} | sed -n '/Begin final coordinates/,/End final coordinates/ {
    /Begin final coordinates/{x;d}
    H
  };
  ${x;p}'`;

alat=`cat ${1} | sed -n '/Begin final coordinates/,/End final coordinates/ {
    /Begin final coordinates/{x;d}
    H
  };
  ${x;p}' | sed 's/)//' | awk 'BEGIN {NLINE=0} {if (NLINE == 3) { print $3; }; ++NLINE }; END {}'`

a_bohr=`cat ${1} | sed -n '/Begin final coordinates/,/End final coordinates/ {
    /Begin final coordinates/{x;d}
    H
  };
  ${x;p}' |awk 'BEGIN {NLINE=0} {if (NLINE == 4) { print $1*'$alat'; }; ++NLINE }; END {}'`;
c_bohr=`cat ${1} | sed -n '/Begin final coordinates/,/End final coordinates/ {
    /Begin final coordinates/{x;d}
    H
  };
  ${x;p}' |awk 'BEGIN {NLINE=0} {if (NLINE == 6) { print $3*'$alat'; }; ++NLINE }; END {}'`;

O_pos=`cat ${1} | sed -n '/Begin final coordinates/,/End final coordinates/ {
    /Begin final coordinates/{x;d}
    H
  };
  ${x;p}' |awk 'BEGIN {NLINE=0} {if (NLINE == 10) { print $4*'$c_bohr'; }; ++NLINE }; END {}'`;

H_pos=`cat ${1} | sed -n '/Begin final coordinates/,/End final coordinates/ {
    /Begin final coordinates/{x;d}
    H
  };
  ${x;p}' |awk 'BEGIN {NLINE=0} {if (NLINE == 12) { print $4*'$c_bohr'; }; ++NLINE }; END {}'`;

OH_dist=`echo '' | awk '{print '$H_pos'-'$O_pos'}'`;

total_energy=`tail -n 500 ${1} | sed -n '/!/,/Ry/ {
    /!/{x;d}
    H
  };
  ${x;p}' | awk '{ E=$4; }; END {print E; }'`;
  
oe_contrib=`tail -n 500 ${1} | sed -n '/one-electron contribution/,/Ry/ {
    /one-electron contribution/{x;d}
  };
  ${x;p}' | awk '{ E=$4; }; END {print E; }'`;
  
hartree_contrib=`tail -n 500 ${1} | sed -n '/hartree contribution/,/Ry/ {
    /hartree contribution/{x;d}
  };
  ${x;p}' | awk '{ E=$4; }; END {print E; }'`;
  
xc_contrib=`tail -n 500 ${1} | sed -n '/xc contribution/,/Ry/ {
    /xc contribution/{x;d}
  };
  ${x;p}' | awk '{ E=$4; }; END {print E; }'`;

ewald_contrib=`tail -n 500 ${1} | sed -n '/ewald contribution/,/Ry/ {
    /ewald contribution/{x;d}
  };
  ${x;p}' | awk '{ E=$4; }; END {print E; }'`;

volume=`cat ${1} | sed -n '/new unit-cell volume/,/a.u.^3/ {
    /new unit-cell volume/{x;d}
  };
  ${x;p}' | awk '{ V=$5; }; END {print V; }'`;
  

enthalpy=`echo '' | awk '{print '$total_energy+$volume'*'$pressure'/'2.94219e13'*'101250000'}'`;

#echo '' | awk ``;
#cat ${1} | sed -n '/Begin final coordinates/,/End final coordinates/ {
#    /Begin final coordinates/{x;d}
#    H
#  };
#  ${x;p}'
  
echo "$pressure		$a_bohr	$c_bohr	$O_pos		$H_pos		$OH_dist			$total_energy	$volume		$enthalpy	$oe_contrib	$hartree_contrib	$xc_contrib	$ewald_contrib"