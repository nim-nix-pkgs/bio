{
  description = ''Bytes utils for Nim.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."bio-master".dir   = "master";
  inputs."bio-master".owner = "nim-nix-pkgs";
  inputs."bio-master".ref   = "master";
  inputs."bio-master".repo  = "bio";
  inputs."bio-master".type  = "github";
  inputs."bio-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."bio-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."bio-v0_1_0".dir   = "v0_1_0";
  inputs."bio-v0_1_0".owner = "nim-nix-pkgs";
  inputs."bio-v0_1_0".ref   = "master";
  inputs."bio-v0_1_0".repo  = "bio";
  inputs."bio-v0_1_0".type  = "github";
  inputs."bio-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."bio-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}