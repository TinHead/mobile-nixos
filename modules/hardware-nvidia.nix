{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.mobile.hardware.socs;
in
{
  options.mobile = {
    hardware.socs.nvidia-tegra-t33.enable = mkOption {
      type = types.bool;
      default = false;
      description = "enable when SOC is Nvidia Tegra T33";
    };
  };

  config = mkMerge [
    {
      mobile = mkIf cfg.nvidia-tegra-t33.enable {
        system.system = "armv7l-linux";
        quirks.fb-refresher.enable = true;
      };
    }
  ];
}
