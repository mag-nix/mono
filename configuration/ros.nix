{ lib, config, ... }:
{
  options.ros-module.overlays = lib.mkOption {
    type = lib.types.attrs;
  };

  config.services.ros = {
    enable = true;
    distro = "noetic";

    masterUri = "http://localhost:11311/";
    hostname = "localhost";

    overlays = [
      config.ros-module.overlays.default
      (rosSelf: rosSuper: {
        roscpp-tutorials = rosSelf.callPackage ../pkgs/roscpp-tutorials { };
        rospy-tutorials = rosSelf.callPackage ../pkgs/rospy-tutorials { };
      })
      # (import ../pkgs)
    ];

    # Nix Package naming
    systemPackages = p: with p; [
      rosbash
      roslaunch
      rostopic
      rospy-tutorials
    ];

    nodes = {
      talker = {
        # ROS Package naming
        package = "rospy_tutorials";
        # ROS Node
        node = "talker";
        # node = "talker_header.py";
      };

      listener = {
        package = "rospy_tutorials";
        node = "listener";
        # node = "listener_header.py";
      };
    };
  };
}