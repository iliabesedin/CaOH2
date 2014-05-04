PLOTTER=gnuplot

ambient_with_experiment.eps: ambient.data experimental.data ambient_with_experiment.gnuplot
	${PLOTTER} ambient_with_experiment.gnuplot

hp_with_experiment.eps: hp.data experimental.data hp_with_experiment.gnuplot
	${PLOTTER} hp_with_experiment.gnuplot

hp_with_ambient.eps: ambient.data hp.data experimental.data hp_with_experiment.gnuplot
	${PLOTTER} hp_with_ambient.gnuplot

iceX.eps: iceX.data iceX.gnuplot
	${PLOTTER} iceX.gnuplot

energy_and_enthalpy.eps: ambient.data hp.data energy_and_enthalpy.gnuplot
	${PLOTTER} energy_and_enthalpy.gnuplot

hp.eps: ambient.data hp.data pv.gnuplot
	${PLOTTER} pv.gnuplot

all: ambient_with_experiment.eps hp_with_experiment.eps hp_with_ambient.eps iceX.eps energy_and_enthalpy.eps hp.eps