#!/bin/bash

tcks=$1
REFERENCE_FILE=$2
tractmasks_folder=$3

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"


for tck_file in $( ls ${tcks}/*.tck ); do
    base_name=$(basename "${tck_file}" .tck)
    output_file="$SCRIPT_DIR/${tractmasks_folder}/${base_name}.nii.gz"
    python trk_2_binary.py "${tck_file}" "${output_file}" "${REFERENCE_FILE}"
done