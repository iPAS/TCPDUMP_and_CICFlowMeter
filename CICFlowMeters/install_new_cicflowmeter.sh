#!/bin/bash

rm -rf CICFlowMeter-3.0

[[ ! -d CICFlowMeter_repo ]] && (\
    git clone https://github.com/iPAS/CICFlowMeter.git CICFlowMeter_repo || (\
        echo "Cannot clone the repository https://github.com/iPAS/CICFlowMeter.git!" && exit 255))

cd CICFlowMeter_repo
gradle clean
gradle build
cd ..

cp CICFlowMeter_repo/build/distributions/CICFlowMeter-3.0.zip .
unzip CICFlowMeter-3.0.zip
rm -f CICFlowMeter-3.0.zip
cp -f CICFlowMeter.revised CICFlowMeter-3.0/bin/CICFlowMeter
