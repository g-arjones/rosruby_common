cmake_minimum_required(VERSION 2.8.3)
project(rosruby_tutorials)
find_package(catkin REQUIRED COMPONENTS rosruby)

catkin_package(
  DEPENDS rosruby rosruby_actionlib rosruby_tf
  )

rosruby_setup()

rosruby_generate_messages(actionlib_tutorials)

install(PROGRAMS
  nodes/add_two_ints_client.rb
  nodes/add_two_ints_server.rb
  nodes/fibonacci_client.rb
  nodes/fibonacci_server.rb
  nodes/talker.rb
  nodes/listener.rb
  nodes/tf_broadcaster.rb
  nodes/tf_listener.rb
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
  )
