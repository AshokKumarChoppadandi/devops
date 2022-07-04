packer {
  required_plugins {
    virtualbox = {
      version = "= 1.0.4"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}

source "virtualbox-iso" "basic-example" {
  vm_name       = "basic-centos-vm"
  guest_os_type = "RedHat_64"
  cpus          = 2
  memory        = 4096
  disk_size     = 25000
  # iso_url        = "http://centos.excellmedia.net/7.9.2009/isos/x86_64/CentOS-7-x86_64-DVD-2009.iso"
  # iso_checksum   = "file:http://centos.excellmedia.net/7.9.2009/isos/x86_64/sha256sum.txt"
  iso_url        = "file://C:\\Users\\lenovo\\IdeaProjects\\devops\\Packer\\VirtualBox\\iso-files\\CentOS-7-x86_64-DVD-1908.iso"
  iso_checksum   = "sha256:9bba3da2876cb9fcf6c28fb636bcbd01832fe6d84cd7445fa58e44e569b3b4fe"
  iso_interface  = "ide"
  bundle_iso     = false
  http_directory = "http"
  http_port_min  = 8000
  http_port_max  = 9000
  ssh_username   = "root"
  ssh_password   = "root"
  ssh_timeout    = "30m"
  boot_command = [
    # "<up><wait><tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/centos7-minimal-ks.cfg<enter>"
    "<up><wait><tab> text ks=http://192.168.0.102/anaconda-ks.cfg<enter>"
  ]
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  format           = "ovf"
}

build {
  sources = [
    "source.virtualbox-iso.basic-example"
  ]
}