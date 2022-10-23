{
  mobile-nixos
, fetchFromGitHub
, python2
, buildPackages
, ncurses
, pkg-config
, ...
}:

mobile-nixos.kernel-builder-gcc6 {
  version = "5.19.0-next-20220812";
  configfile = ./config.armv7;

  src = fetchFromGitHub {
    owner = "grate-driver";
    repo = "linux";
    rev = "cd583feebd92a62cdef3d0077a5ce384d632d094";
    sha256 = "sha256-6/BLvAvcxi4x48MWdmp3UTmYUg0/pUtMnRuddlZw3YM=";
  };

  #atches = [
#   ./90_dtbs-install.patch
# ];

# isImageGzDtb = true;
# isModular = false;

  # mv: cannot stat 'arch/arm/boot/compressed/.head.o.tmp': No such file or directory
  enableParallelBuilding = false;
}
