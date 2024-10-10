{ toplevel }:
final: prev:
let
callPackage = if toplevel then prev.rosPackages.noetic.callPackage else prev.callPackage;
in
{
  rospy-tutorials = callPackage ./rospy-tutorials { };
  roscpp-tutorials = callPackage ./roscpp-tutorials { };
}