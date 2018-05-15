CICFlowMeter (formerly ISCXFlowMeter) is a network traffic flow generator available from here . It can be used to generate bidirectional flows, where the first packet determines the forward (source to destination) and backward (destination to source) directions, hence the statistical time-related features can be calculated separately in the forward and backward directions. Additional functionalities include, selecting features from the list of existing features, adding new features, and controlling the duration of flow timeout.
 
NOTE: TCP flows are usually terminated upon connection teardown (by FIN packet) while UDP flows are terminated by a flow timeout. The flow timeout value can be assigned arbitrarily by the individual scheme e.g., 600 seconds for both TCP and UDP.
 
--------------------------------------------------------------
Installation and executing:

Copy CICFlowMeter.jar file and jnetpcap folder in any path on your computer. 
Create a folder and add all your PCAP files there as input folder.
Create a folder as output folder for saving your CSV files there. 
Run this command:
java -Djava.library.path="Your jnetpcap folder path" -jar CICFlowMeter.jar "yout pcap files path as input" "your output folder for CSV generated files"

Example:
java -Djava.library.path=/home/CIC/Desktop/jnetpcap -jar CICFlowMeter.jar /home/CIC/Desktop/1/ /home/CIC/Desktop/2/


--------------------------------------------------------------

Contact us at A.Habibi.L@unb.ca if there are any problems.  


For citation in your works and also understanding CICFlowMeter (formerly ISCXFlowMeter) completely, you can find below published papers:

Arash Habibi Lashkari, Gerard Draper-Gil, Mohammad Saiful Islam Mamun and Ali A. Ghorbani, "Characterization of Tor Traffic Using Time Based Features", In the proceeding of the 3rd International Conference on Information System Security and Privacy, SCITEPRESS, Porto, Portugal, 2017

Gerard Drapper Gil, Arash Habibi Lashkari, Mohammad Mamun, Ali A. Ghorbani, "Characterization of Encrypted and VPN Traffic Using Time-Related Features", In Proceedings of the 2nd International Conference on Information Systems Security and Privacy(ICISSP 2016) , pages 407-414, Rome , Italy
