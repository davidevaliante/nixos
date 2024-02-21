{ config, pkgs, ... }:
{
  home.username = "host";
  home.homeDirectory = "/home/host";

  home.packages = with pkgs; [
    cowsay
    hello
    htop
  ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
