{ config, lib, nixpkgs, nix-ros-overlay, pkgs, ... }:
{
  imports = [
    ./ros.nix
  ];

  ros-module.overlay = nix-ros-overlay;
  ros-module.pkgs = pkgs;

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

  services.sshd.enable = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "robotix" ];
  };

  security.sudo.wheelNeedsPassword = false;

  system.stateVersion = "24.05";
}
