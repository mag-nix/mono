
# Copyright 2024 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, message-generation, message-runtime, rosconsole, roscpp, roscpp-serialization, rostime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-roscpp-tutorials";
  version = "0.10.2-r1";

  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.unions [
      ./add_two_ints_client
      ./add_two_ints_server
      ./add_two_ints_server_class
      ./anonymous_listener
      ./babbler
      ./cached_parameters
      ./custom_callback_processing
      ./launch
      ./listener
      ./listener_async_spin
      ./listener_class
      ./listener_multiple
      ./listener_single_message
      ./listener_threaded_spin
      ./listener_unreliable
      ./listener_with_tracked_object
      ./listener_with_userdata
      ./node_handle_namespaces
      ./notify_connect
      ./parameters
      ./srv
      ./talker
      ./time_api
      ./timers
      ./CMakeLists.txt
      ./package.xml
    ];
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ boost message-runtime rosconsole roscpp roscpp-serialization rostime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = "This package attempts to show the features of ROS step-by-step,
    including using messages, servers, parameters, etc.";
    license = with lib.licenses; [ bsdOriginal ];
  };
}
