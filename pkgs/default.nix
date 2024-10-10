final: prev:
let
  newScope = if builtins.hasAttr "rosPackages" prev then
    # Called from root level e.g. for the develop shell
    extra: prev.lib.callPackageWith (prev // prev.rosPackages.noetic // final.local.noetic)
  else
    # Called from rosPackages.noetic level e.g. for the ros service
    extra: prev.lib.callPackageWith (prev // final.local.noetic);
  local = final.lib.makeScope newScope (localPrev: {
    noetic = {
      rospy-tutorials = localPrev.callPackage ./rospy-tutorials {};
      roscpp-tutorials = localPrev.callPackage ./roscpp-tutorials {};
    };
  });
in {
  inherit local;

  final = if builtins.hasAttr "rosPackages" prev then
    { rosPackages = final.lib.recursiveUpdate prev.rosPackages local; }
  else
    final.lib.recursiveUpdate prev local.noetic;
}
