#!/bin/bash

script_name=$(basename $0 .sh)
version=${script_name##*-}
[[ "${version}" == "" ]] && echo "Please run one of the links to this script!!" && exit 255

rm -rf CICFlowMeter-${version}

[[ ! -d CICFlowMeter_repo ]] && (\
    git clone https://github.com/iPAS/CICFlowMeter.git CICFlowMeter_repo || (\
        echo "Cannot clone the repository https://github.com/iPAS/CICFlowMeter.git!" && exit 255))

cd CICFlowMeter_repo
git fetch
git checkout tags/CICFlowMeter-${version}-commandline
gradle clean
gradle build
cd ..

# cp CICFlowMeter_repo/build/distributions/CICFlowMeter-${version}.zip .
# unzip CICFlowMeter-${version}.zip
# rm -f CICFlowMeter-${version}.zip
tar -xf CICFlowMeter_repo/build/distributions/CICFlowMeter-${version}.tar -C .
cp -f CICFlowMeter.revised CICFlowMeter-${version}/bin/CICFlowMeter
