{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShell ({
          nativeBuildInputs =
            [
              pkgs.python3
              pkgs.pyright
            ]
            ++ (with pkgs.python3.pkgs; [
              aiofiles
              ajsonrpc
              bottle
              click
              click-completion
              colorama
              lockfile
              marshmallow
              pyelftools
              pyserial
              requests
              semantic-version
              setuptools
              # spdx-license-list-data.json
              starlette
              tabulate
              uvicorn
              wsproto
              zeroconf
            ]);
        }); # devShell = pkgs.mkShell {
        #   buildInputs = [
        #     pkgs.platformio.passthru.env
        #     pkgs.python3
        #     pkgs.gnumake
        #   ];
        # };
      }
    );
}
