#!/bin/bash

trash CICFlowMeter-3.0
cp CICFlowMeter_repo/build/distributions/CICFlowMeter-3.0.zip .
unzip CICFlowMeter-3.0.zip
rm -f CICFlowMeter-3.0.zip
cp CICFlowMeter.revised CICFlowMeter-3.0/bin/CICFlowMeter 

