#!/usr/bin/env python

####################################################################
#
# A circular stack
#
####################################################################

from camfr import *
from Numeric import *

set_lambda(1)
set_N(20)
set_circ_order(0)
set_polarisation(TE)

# Define materials.

GaAs = Material(3.5)
air  = Material(1.0)

# Define uniform circular waveguide.

space = Circ(air(1 - 0.1j))

# Calculate the reflectivity for different widths
# of the central core.

for r in arange(0.100, 0.500, 0.050):
    circ = Circ(GaAs(r) + air(1 - 0.1j - r))
    stack = Stack(space(0) + circ(0.5) + space(0))
    stack.calc()
    print r, abs(stack.R12(0,0))
    free_tmps()
