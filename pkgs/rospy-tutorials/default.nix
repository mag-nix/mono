
# Copyright 2024 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, roscpp-tutorials, rospy, rostest, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-rospy-tutorials";
  version = "0.10.2-r1";

  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.unions [
      ./001_talker_listener
      ./002_headers
      ./003_listener_with_user_data
      ./004_listener_subscribe_notify
      ./005_add_two_ints
      ./006_parameters
      ./007_connection_header
      ./008_on_shutdown
      ./009_advanced_publish
      ./msg
      ./srv
      ./test
      ./CMakeLists.txt
      ./package.xml
    ];
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation rostest ];
  checkInputs = [ roscpp-tutorials ];
  propagatedBuildInputs = [ message-runtime rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = "This package attempts to show the features of ROS python API step-by-step,
    including using messages, servers, parameters, etc. These tutorials are compatible with the nodes in roscpp_tutorial.";
    license = with lib.licenses; [ bsdOriginal ];
  };
}