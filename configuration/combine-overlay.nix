{ nix-ros-overlay }:
final: prev: with prev.lib;
foldr composeExtensions (_: _: {}) [
  nix-ros-overlay.overlays.default
  (import ./pkgs)
] final prev
