{ config, lib, nixpkgs, nix-ros-overlay, ... }:
# let
# overlay.list = [
#   (import ./combine-overlay.nix { inherit nix-ros-overlay; })
# ];
# in
{
  imports = [
    ./ros.nix
  ];

  ros-module.overlays = nix-ros-overlay.overlays;

  boot.kernelParams = [ "console=tty0" ];

  users.users."robotix" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "robot";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII85Hgi5bFo5FAkZh4CxQoyWk4f7AoxpUawXnmuQWJUI jeising@pdemu1cml000342"
    ];
  };

  services.getty.autologinUser = "robotix";

  networking.networkmanager.enable = true;

  networking.hostName = "nixos";

  networking.useDHCP = false;
  networking.interfaces.ens2.ipv4.addresses = [ {
    address = "192.168.122.11";
    prefixLength = 24;
  } ];

  services.sshd.enable = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "robotix" ];
  };

  security.sudo.wheelNeedsPassword = false;

  system.stateVersion = "24.05";
}
