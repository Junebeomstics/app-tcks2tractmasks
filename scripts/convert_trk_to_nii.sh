#!/bin/bash

TCKS=$1
REFERENCE_FILE=$2
tractmasks_folder=$3

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

if [ ! -d "$TCKS" ]; then
    TCKS="${TCKS%/tcks}"
fi

for tck_file in $( ls ${TCKS}/*.tck ); do
    echo $tck_file
    base_name=$(basename "${tck_file}" .tck)
    output_file="${tractmasks_folder}/${base_name}.nii.gz"
    python scripts/trk_2_binary.py "${tck_file}" "${output_file}" "${REFERENCE_FILE}"
done