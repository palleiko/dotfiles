#!/bin/bash
bat="Battery 0: "
acpi_out="$(acpi)"
acpi_out="${acpi_out#$bat}"
echo "${acpi_out}" | sed 's/,.*//'
