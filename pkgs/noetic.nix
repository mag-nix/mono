final: prev: {
  rosPackages.noetic = prev.rosPackages.noetic ++ [
    rosFinal: rosPrev: {
      rospy-tutorials-local = rosFinal.callPackage ./rospy-tutorials { };
    }
  ];
}