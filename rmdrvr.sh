#!/bin/sh

module="lscpcie2"

if [ `whoami` != root ]; then
	echo "ERROR! Must be root to remove driver."
	exit 1
fi

echo "Removing driver module "${module}" from kernel."

# Remove driver
/sbin/rmmod -v ${module}.ko

echo "Done."

