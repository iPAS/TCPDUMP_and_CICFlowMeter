#!/bin/bash

pcap_file="$1"

[[ ! -f "${pcap_file}" ]] && echo "PCAP file ${pcap_file} does NOT exist!" && exit 255

#echo $pcap_file
#echo $script_dir

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  # On the same directory.
"${script_dir}"/CICFlowMeter-3.0/bin/CICFlowMeter "${pcap_file}" "${script_dir}"/csv
