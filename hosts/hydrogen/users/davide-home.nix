{ config, pkgs, ... }:
{
  home.username = "davide";
  home.homeDirectory = "/home/davide";

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod, Q, exec, kitty"
      "$mod, P, exec, kitty"
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, C, killactive"
    ];
  };

  home.packages = with pkgs; [
    neofetch
    btop
    vscode
  ];

  programs.git = {
    enable = true;
    userName = "Davide Valiante";
    userEmail = "dav.valiante@gmail.com";
  };

  programs.vscode = {
    enable = true;
    enableUpdateCheck = true;
    enableExtensionUpdateCheck = true;
    extensions = with pkgs; [
      vscode-extensions.catppuccin.catppuccin-vsc
      vscode-extensions.github.copilot
      vscode-extensions.mhutchie.git-graph
    ];
    userSettings = {
      "telemetry.telemetryLevel" = "off";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "[nix]"."editor.tabSize" = 2;

      # customize the bar at the top
      "window.titleBarStyle" = "custom";
      "workbench.colorCustomizations" = {
	# this is equivalent to Catppucin Mocha "Crust" color
        "titleBar.activeBackground" = "#11111b";      
        "titleBar.activeForeground" = "#fff";
      };
      "window.menuBarVisibility" = "compact";
    };
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
