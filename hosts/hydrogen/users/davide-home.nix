{ config, pkgs, ... }:
{
  home.username = "davide";
  home.homeDirectory = "/home/davide";

  home.packages = with pkgs; [
    neofetch
    btop
  ];

  programs.git = {
    enable = true;
    userName = "Davide Valiante";
    userEmail = "dav.valiante@gmail.com";
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
