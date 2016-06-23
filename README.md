Application description
=======================
FortiClient extends the power of FortiGate's Unified threat management to endpoints on your network. Desktops, laptops, tablets & smartphones, FortiClient enables every device - local or remote, stationary or mobile - to integrate with your FortiGate. With no per-seat license fees, FortiClient takes the headaches out of managing multiple endpoints so your users & guests can work efficiently anywhere, without compromising your security. It's the end-point solution for your FortiGate network.

Features
--------
* Install & uninstall via Chocolatey
* [NEW] Tests local source (if exists) to prevent dowloading package from Internet 
	* \\\\office.eleader.biz\packages\choco\forticlient*.msi 
* Requires source path to MyGet

#### 2016-06-23 Build 5.4.0839 (interim)
* another interim
* rebuild mst file for eLeader config

#### 2016-06-18 Build 5.4.0837 (interim)
* improved $env:TEMP logic, with Choco 0.9.10 path contained double 'chocolatey' reference - bug https://github.com/chocolatey/choco/commit/a9519b513b926255ad5bc35cf42b5e811ed77447

#### 2016-06-17 Build 5.4.0837 (interim)
* improved logic in uninstalling registered Forticlient (now, throw an error when uninstall fails)
* switch to another interim build with custom config
* added 'REINSTALLMODE=vomus REINSTALL=ALL ' to MSI install parameters (minor/major upgrade handling feature)

#### 2016-05-31 Build 5.4.0822 (interim)
* first build with double source (local or remote) instalation
* no change to package binary version (only source)

#### 2016-05-17 Build 5.4.0822
* first interim build 5.4.0822
* first build with standalone Fortinet MSI installer
* included config for eLeader Fortigate connection

#### 2016-05-15 Build 5.4.0780 
* first stable 5.4
* uninstall omits Uninstall-ChocolateyPackage due to erros

# Usage
## Direct
``` 
choco install forticlient -source https://www.myget.org/F/eleader/ 
```
or with added source
```
choco source add -n=eLeader -s"https://www.myget.org/F/eleader/api/v2" --priority=10
choco install forticlient
```
## YAML
```
forticlient:
  ensure: latest
  uninstall_options: "--force --all-versions"
  provider: chocolatey
  source: https://www.myget.org/F/eleader/
```  