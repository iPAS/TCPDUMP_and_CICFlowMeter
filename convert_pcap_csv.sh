#!/bin/bash

pcap_file="$1"
[[ ! -f "${pcap_file}" ]] && echo "PCAP file ${pcap_file} does NOT exist!" && exit 255

#echo $pcap_file
#echo $script_dir

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  # On the same directory.
output_dir="${script_dir}"/csv


# CICFlowMeter-3.0/bin/CICFlowMeter
"${script_dir}"/CICFlowMeters/CICFlowMeter-3.0/bin/CICFlowMeter "${pcap_file}" "${output_dir}"


pcap_dir="${script_dir}"/tmp  # On the same directory.
mv "${pcap_file}" "${pcap_dir}"
pcap_file="${pcap_dir}"/$(basename "${pcap_file}")

echo '---'
ls "${pcap_dir}"
echo '---'

# CICFlowMeterV2
cic_dir="${script_dir}"/CICFlowMeters/CICFlowMeterV2
java -Djava.library.path="${cic_dir}" -jar "${cic_dir}"/CICFlowMeter.jar "${pcap_dir}/" "${output_dir}/2/"

# CICFlowMeterV3-jnetpcap-1.3
cic_dir="${script_dir}"/CICFlowMeters/CICFlowMeterV3-jnetpcap-1.3
#java -Djava.library.path="${cic_dir}" -jar "${cic_dir}"/CICFlowMeterV3.jar "${pcap_file}" "${output_dir}/3.1.3/"

# CICFlowMeterV3-jnetpcap-1.4
cic_dir="${script_dir}"/CICFlowMeters/CICFlowMeterV3-jnetpcap-1.4
#java -Djava.library.path="${cic_dir}" -jar "${cic_dir}"/CICFlowMeterV3.jar "${pcap_file}" "${output_dir}/3.1.4/"


rm -f "${pcap_file}"
