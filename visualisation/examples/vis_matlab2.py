#!/usr/bin/env python

####################################################################
#
# Illustrates the use Matlab plotting to keep track of the 
# simulation progress.
#
####################################################################

from camfr import *
from Numeric import *
from camfr_matlab import *

set_lambda(1)
set_N(50)
set_polarisation(TE)

# Define materials.

GaAs = Material(3.5)
air  = Material(1.0)

# Define slabs.

PML = 0.1

space = Slab(air(4 - 2*PML*1j))

# Calculate reflectivity for different widths.

v = []

for W in arange(.100,.200,.010):

    slab = Slab(air(2 - PML*1j - W/2.) + GaAs(W)  \
              + air(2 - PML*1j - W/2.))
    stack = Stack(space(0) + slab(0.5) + space(0))
    stack.calc()

    v.append((W, abs(stack.R12(1,1))))
    plot_vector(v)

    free_tmps()

raw_input("Press <enter> to continue.")

