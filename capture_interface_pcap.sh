#!/bin/bash

interface=$1
output_dir=$2
user=$3

[[ "$(grep -c "$interface" /proc/net/dev)" == "0" ]] && echo "The interface is NOT found!" && exit 255
[[ ! -d "$output_dir" ]] && echo "The output directory does NOT exist!" && exit 255

#output_file=${output_dir}/$(date +'%Y-%m-%d-%H:%M:%S.pcap')
output_file_format=${output_dir}/'%Y-%m-%d-%H:%M:%S.pcap'

rotate_interval=5
options="-n -nn -N -s 0"

[[ ! -z "${user}" ]] && options="${options} -Z ${user}"  #$(id -nu 1000)

# Before the post-rotatation script can be run, please edit an AppArmor configuration file:
#   $ sudo vi /etc/apparmor.d/usr.sbin.tcpdump
# by adding the line:
#   /**/* ixr,
# then
#   $ sudo service apparmor restart
#
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  # On the same directory.
post_rotate_command="${script_dir}"/convert_pcap_csv.sh

sudo tcpdump ${options} -z "${post_rotate_command}" -i ${interface} -G ${rotate_interval} -w "${output_file_format}"
#sudo chown 1000:1000 "${output_dir}"/*
