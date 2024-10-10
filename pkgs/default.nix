final: prev:
  let
    newScope = if builtins.hasAttr "rosPackages" prev then
      # Called from root level e.g. for the develop shell
      extra: prev.lib.callPackageWith (prev // prev.rosPackages.noetic // final.local)
    else
      # Called from rosPackages.noetic level e.g. for the ros service
      extra: prev.lib.callPackageWith (prev // final.local);
  in {
    local = final.lib.makeScope newScope (localPrev: {
      std-msgs = localPrev.callPackage ./std-msgs {};
      rospy-tutorials = localPrev.callPackage ./rospy-tutorials {};
      roscpp-tutorials = localPrev.callPackage ./roscpp-tutorials {};
    });
  }
