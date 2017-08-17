#!/bin/bash
bat="Battery 0: "
acpi_out="$(acpi)"
acpi_out="${acpi_out#$bat}"
acpi_out=`echo ${acpi_out} | sed 's/,.*//'`
if [ ${acpi_out} = "Charging" ]; then 
	echo 1
else
	echo 0
fi
