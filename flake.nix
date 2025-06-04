{
  description = ".NET Test Driven microservice API";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      withSystem = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      withPkgs = callback: withSystem (system: callback (import nixpkgs { inherit system; }));
    in
    {
      devShells = withPkgs (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            # .NET Toolchain
            dotnetCorePackages.sdk_9_0

            # IaC
            opentofu

            # Kubernetes
            kind
            kubectl
            k9s

            # Development Tooling
            just
            sops
            age
          ];

          env = {
            DOTNET_ROOT = builtins.toString pkgs.dotnetCorePackages.sdk_9_0;
          };
        };
      });

      formatter = withPkgs (pkgs: pkgs.nixfmt-rfc-style);
    };
}
