
# Introduction

This project is about capturing packets flow through a network interface,
    save each specific-size chunk into a PCAP file,
    and then automatically convert it to the feature-extracted CSV file by
    CICFlowMeter-3.0.

The CSV is meant to be analysed for intrusion detection.
You can find further detail at the [website of CIC](http://www.unb.ca/cic).

* This repository is maintained Pasakorn Tiwatthanont, <ptiwatthanont@gmail.com>.
* Thank you for guiding relevant tools to Mr. Preecha Pangsuban <preecha@yru.ac.th>.


# Usage

Calling __capture_interface_pcap.sh__ will capture the packets since the beginning
    until specific time in the script, periodically.
Each time that PCAP file is saved,
    the script __convert_pcap_csv.sh__ will be called the converter, __CICFlowMeter__.


```bash
capture_interface_pcap.sh <interface> <pcap_output_dir> [priviledged_user_name]
```

For example:

```bash
capture_interface_pcap.sh wlan0 pcap
```

or

```bash
capture_interface_pcap.sh eth0 output_dir bobuser
```


# Note on Creation


## CICFlowMeter

### Download and Use

Get the package from the [website of CIC](http://www.unb.ca/cic/_assets/documents/cicflowmeter-v3.zip).
Then, unpack and revise the code in script __CICFlowMeter-3.0/bin/CICFlowMeter__ by refering with real path:

    DEFAULT_JVM_OPTS='"-Djava.library.path=../lib/native"'

to

    DEFAULT_JVM_OPTS='"-Djava.library.path='$APP_HOME/lib/native'"'

### Build It by Yourself (option)

#### Get Gradle

```bash
chmod +x gradlew
./gradlew
```

However, this is not neccessary in case you already have it.

#### Update CICFlowMeter

In CICFlowMeter directory, please:

```bash
git fetch --all
git reset original/master --hard
```

All code will be renew as the original repository.
All revised files will be gone, even yours.

#### Build CICFlowMeter

Edit the build.gradle file, enable to find JNetPCAP package:

1) Add a new repository:

```
repositories {
    ...

    maven {
        url "http://clojars.org/repo/"
    }

}
```

2) Reversion the dependency:

```
dependencies {
    ...

    // compile group: 'org.jnetpcap', name: 'jnetpcap', version:'1.4.1'
    compile group: 'jnetpcap', name: 'jnetpcap', version: '1.4.r1425-1g'

```

Then, build the project:

```bash
gradle build
```

#### Run CICFlowMeter

To run the GUI:

```bash
gradle run
```

