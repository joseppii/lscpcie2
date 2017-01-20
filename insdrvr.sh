#!/bin/sh

#----------------------------------------------------------------------
# This shell script installs the the Lattice lscpcie2 Driver Module
# into the Linux kernel.
#
# The major number is dynamically assigned.
# some how we are going to get an entry into the /dev via udev

# dynamically assigned Major number for lscpcie2.ko
# Minor nmbers identify the board type, instance and BAR.
# This version creates 4 SC entries and 4 EC entries, each with 6
# BARs. The base module name is "lscpcie2".  The extension is ".ko"
# which represents a kernel object.
#----------------------------------------------------------------------

module="lscpcie2"

if [ `whoami` != root ]; then
	echo "ERROR! Must be root to install driver."
	exit 1
fi

echo "Installing driver module "${module}" into kernel."

# Install the driver module (pass any command line args - none expected)
/sbin/insmod -f ./${module}.ko $* || exit 1


echo "Done."

