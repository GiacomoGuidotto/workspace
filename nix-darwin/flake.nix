{
  description = "nix-darwin system flake";

  inputs = {
    # import nixpkgs flake with `unstable` channel
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # import nix-darwin flake
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # import home-manager flake
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # the platform the configuration will be used on
      nixpkgs.hostPlatform = "aarch64-darwin";

      # home-manager external configuration
      users.users.giacomo.home = "/Users/giacomo";
      home-manager.backupFileExtension = "backup";

      # used for backwards compatibility
      # please read the changelog BEFORE changing:
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # set git commit hash for darwin-version
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # nix configuration
      services.nix-daemon.enable = true;
      nix.settings.experimental-features = "nix-command flakes";
      nix.useDaemon = true;

      # packages installed in system profile
      # to search by name: $ nix-env -qaP | grep vim
      environment.systemPackages = with pkgs; [
        # nix internals
        nixd
        nil

        # terminals
        warp-terminal
        # ghostty

        # tools
        stow
        tree
        fzf
        eza
        neofetch
        lazygit
        lazydocker
        raycast

        # editors
        neovim
        zed-editor
        vim

        # apps
        spotify
        tailscale
        discord
        arc-browser
        signal-desktop
      ];

      nixpkgs.config.allowUnfreePredicate =
        pkg : builtins.elem (pkgs.lib.getName pkg) [
          "warp-terminal"
          "raycast"
          "spotify"
          "discord"
          "arc-browser"
          "signal-desktop"
        ];

      # other programs
      services.tailscale.enable = true;
    };
  in
  {
    # build darwin flake:
    # $ darwin-rebuild build --flake ./nix-darwin#main
    darwinConfigurations.main = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs; };
      system = "aarch64-darwin";
      modules = [
        configuration
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.giacomo = import ./home.nix;
        }
      ];
    };
  };
}
