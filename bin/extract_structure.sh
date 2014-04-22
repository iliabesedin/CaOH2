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
  ${x;p}' | awk 'BEGIN {NLINE=0} {if (NLINE == 2) { print $6; }; ++NLINE }; END {}'`;

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
#echo '' | awk ``;
#cat ${1} | sed -n '/Begin final coordinates/,/End final coordinates/ {
#    /Begin final coordinates/{x;d}
#    H
#  };
#  ${x;p}'
  
echo "$pressure		$a_bohr	$c_bohr	$O_pos		$H_pos		$OH_dist"