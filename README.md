Application description
=======================
FortiClient extends the power of FortiGate's Unified threat management to endpoints on your network. Desktops, laptops, tablets & smartphones, FortiClient enables every device - local or remote, stationary or mobile - to integrate with your FortiGate. With no per-seat license fees, FortiClient takes the headaches out of managing multiple endpoints so your users & guests can work efficiently anywhere, without compromising your security. It's the end-point solution for your FortiGate network.

Features
--------
* Install & uninstall via Chocolatey
* Requires \\office.eleader.biz\packages\choco\forticlient*.msi

#### 2016-05-15 Wersja 5.4.780 
* first stable 5.4
* uninstall omits Uninstall-ChocolateyPackage due to erros

# Usage
## Direct
``` 
choco install forticlient -source https://www.myget.org/F/eleader/ 
```
## YAML
```
forticlient:
  ensure: latest
  uninstall_options: "--force --all-versions"
  provider: chocolatey
  source: https://www.myget.org/F/eleader/
```  