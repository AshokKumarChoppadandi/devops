# VIRTUAL BOX - SHARED FOLDERS SETUP

### Pre-requisites
* Virtual Box
* Running VM (CentOS 7 Minimal)
* `sudo` or `root` permissions for user in VM

### Steps

1. Start Virtual Machine (VM)

<img src="./Screenshots/StartVM.png">

2. Login

<img src="./Screenshots/VM_Login.png">

3. Install dependent packages

```
sudo yum install epel-release -y
```

<img src="./Screenshots/EPEL_Release_Install.png">

```
sudo yum install gcc make perl kernel-devel kernel-headers bzip2 dkms -y
```

<img src="./Screenshots/YumInstall_2.png">

<img src="./Screenshots/YumInstall_3.png">

```
sudo reboot
```

<img src="./Screenshots/Reboot_1.png">

4. Identify the 

scp "C:\Program Files\Oracle\VirtualBox\VBoxGuestAdditions.iso" bigdata@192.168.0.133:/home/bigdata




sudo mkdir -p /media/VirtualBoxGuestAdditionsISO
sudo mount -o loop /home/bigdata/VBoxGuestAdditions.iso /media/VirtualBoxGuestAdditionsISO
sudo cd /media/VirtualBoxGuestAdditionsISO
sudo ./VBoxLinuxAdditions.run
sudo reboot
sudo usermod --append --groups vboxsf ansible
sudo reboot



