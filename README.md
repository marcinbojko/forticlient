Application description
=======================
FortiClient extends the power of FortiGate's Unified threat management to endpoints on your network. Desktops, laptops, tablets & smartphones, FortiClient enables every device - local or remote, stationary or mobile - to integrate with your FortiGate. With no per-seat license fees, FortiClient takes the headaches out of managing multiple endpoints so your users & guests can work efficiently anywhere, without compromising your security. It's the end-point solution for your FortiGate network.

Features
--------
* Install & uninstall via Chocolatey
* [DEPRECATED] Requires \\\\office.eleader.biz\packages\choco\forticlient*.msi 
* Requires source path to MyGet

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