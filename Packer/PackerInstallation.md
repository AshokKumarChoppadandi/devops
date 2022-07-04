# Installing Hashicorp Packer on Windows 11

## Introduction

Packer is an open source tool that enables you to create identical machine images for multiple platforms from a single source template. A common use case is creating "golden images" that teams across an organization can use in cloud infrastructure.

## Installing Packer

### Download:

https://www.packer.io/downloads

<img src="../Packer/Screenshots/PackerDownloadPage.jpg"> 

### Unzip:

<img src="../Packer/Screenshots/PackerUnzip.jpg"> 

### Move to Program files:

<img src="../Packer/Screenshots/PackerInProgramFiles.jpg"> 

### Adding packer binary to PATH environment variable:

* Copy the packer path

<img src="../Packer/Screenshots/PackerInstallationDir.jpg"> 

* Press START / Windows + environment

<img src="../Packer/Screenshots/PackerEnv0.jpg">

* Add the packer directory path to PATH environment variable

<img src="../Packer/Screenshots/PackerEnv1.jpg">

### Validate Packer Installation

* Open Command Prompt (Windows + CMD)

* Run `packer` or `packer version`

```
> packer

OR 

> packer version
```

<img src="../Packer/Screenshots/PackerVersion.jpg">

### Restart the System

<img src="../Packer/Screenshots/PackerRestart.jpg">
