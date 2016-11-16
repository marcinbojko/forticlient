# Forticlient package

## Description

FortiClient extends the power of FortiGate's Unified threat management to endpoints on your network. Desktops, laptops, tablets and smartphones, FortiClient enables every device - local or remote, stationary or mobile - to integrate with your FortiGate. With no per-seat license fees, FortiClient takes the headaches out of managing multiple endpoints so your users and guests can work efficiently anywhere, without compromising your security. It's the end-point solution for your FortiGate network.

## Features

* Install and uninstall via Chocolatey
* Requires source path to MyGet
* Supports ONLY 64-bit version
* Includes interim versions

## Changelog

### 2016-10-16 Build 5.4.2.0860 (GA)

* version 5.4.2.0860
* VirusTotal link - [https://www.virustotal.com/en/file/4a2f43dff6e3405237aa1666dddc5ead228163ae7a5f3bdd30081b6a212b6464/analysis/1479323904/](https://www.virustotal.com/en/file/4a2f43dff6e3405237aa1666dddc5ead228163ae7a5f3bdd30081b6a212b6464/analysis/1479323904/)
* SHA256 - 4a2f43dff6e3405237aa1666dddc5ead228163ae7a5f3bdd30081b6a212b6464

### 2016-08-11 Build 5.4.0842 (5.4.1 Interim)

* version 5.4.0842
* VirusTotal link [https://www.virustotal.com/en/file/7512d7125e76f158f1a755e92975a78407319811ae55b27f40b31917648e25db/analysis/1476181409/](https://www.virustotal.com/en/file/7512d7125e76f158f1a755e92975a78407319811ae55b27f40b31917648e25db/analysis/1476181409/)
* SHA256 - 7512d7125e76f158f1a755e92975a78407319811ae55b27f40b31917648e25db

### 2016-08-02 Build 5.4.0840 (5.4.1 GA)

* removed Write-ChocolateySuccess/Failure according to new design base
* adding option to kill exec before attempting to install/upgrade
* updated README.md
* package rebuilt

### 2016-06-27 Build 5.4.0840 (5.4.1 GA)

* first GA in line of 5.4.1 builds
* added fix for SSL VPN DNS

```xml
<sslvpn>
 <options>
  <dnscache_service_control>2</dnscache_service_control>
 </options>
</sslvpn>
```

### 2016-06-23 Build 5.4.0839 (interim)

* another interim
* rebuild mst file for eLeader config

### 2016-06-18 Build 5.4.0837 (interim)

* improved $env:TEMP logic, with Choco 0.9.10 path contained double 'chocolatey' reference - bug https://github.com/chocolatey/choco/commit/a9519b513b926255ad5bc35cf42b5e811ed77447

### 2016-06-17 Build 5.4.0837 (interim)

* improved logic in uninstalling registered Forticlient (now, throw an error when uninstall fails)
* switch to another interim build with custom config
* added 'REINSTALLMODE=vomus REINSTALL=ALL ' to MSI install parameters (minor/major upgrade handling feature)

### 2016-05-31 Build 5.4.0822 (interim)

* first build with double source (local or remote) instalation
* no change to package binary version (only source)

### 2016-05-17 Build 5.4.0822

* first interim build 5.4.0822
* first build with standalone Fortinet MSI installer
* included config for eLeader Fortigate connection

### 2016-05-15 Build 5.4.0780

* first stable 5.4
* uninstall omits Uninstall-ChocolateyPackage due to erros

## Usage

### Direct

```cmd
choco install forticlient -source https://www.myget.org/F/eleader/ 
```

or with added source

```cmd
choco source add -n=public-choco -s"https://www.myget.org/F/public-choco" --priority=10
choco install forticlient
```

### YAML

```yaml
forticlient:
  ensure: latest
  uninstall_options: "--force --all-versions"
  provider: chocolatey
  source: https://www.myget.org/F/eleader/
```
