{ lib, pkgs, ... }:

{
  mobile.device.name = "asus-tf700t";
  mobile.device.identity = {
    name = "Transformer Infinity";
    manufacturer = "Asus";
  };

  mobile.hardware = {
    soc = "nvidia-tegra-t33";
    ram = 1024 * 1;
    screen = {
      width = 1920; height = 1200;
    };
  };

  mobile.boot.stage-1 = {
    kernel.package = pkgs.callPackage ./kernel { };
  };

  mobile.system.android.device_name = "tf700t";
  mobile.system.android = {
    bootimg.flash = {
      offset_base = "0x80000000";
      offset_kernel = "0x00008000";
      offset_ramdisk = "0x04000000";
      offset_second = "0x00f00000";
      offset_tags = "0x00000100";
      pagesize = "2048";
    };
  };

  # The bootloader strips `console=` arguments.
  # If you need to set any, customize CONFIG_CMDLINE in the kernel configuration.
  boot.kernelParams = [
  ];
  mobile.system.system = "armv7l-linux";
  mobile.system.type = "android";

  mobile.usb.mode = "android_usb";

  # Google
  mobile.usb.idVendor = "18D1";
  # "Nexus 4"
  mobile.usb.idProduct = "D001";

  # The vendor kernel has loads of issues building with USER_NS.
  # For now disable it. Patching should be possible, but will take time.
  mobile.kernel.structuredConfig = [
    (helpers: with helpers; {
      USER_NS = lib.mkForce no;
      UIDGID_STRICT_TYPE_CHECKS = lib.mkForce no;
    })
  ];
}
