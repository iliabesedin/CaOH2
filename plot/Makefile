PLOTTER=gnuplot

ambient_with_experiment.eps: ambient.data experimental.data ambient_with_experiment.gnuplot
	${PLOTTER} ambient_with_experiment.gnuplot

hp_with_experiment.eps: hp.data experimental.data hp_with_experiment.gnuplot
	${PLOTTER} hp_with_experiment.gnuplot

hp_with_ambient.eps: ambient.data hp.data experimental.data hp_with_experiment.gnuplot
	${PLOTTER} hp_with_ambient.gnuplot

all: ambient_with_experiment.eps hp_with_experiment.eps hp_with_ambient.eps