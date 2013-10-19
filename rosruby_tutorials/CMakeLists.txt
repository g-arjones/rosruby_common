cmake_minimum_required(VERSION 2.8.3)
project(rosruby_tutorials)
find_package(catkin REQUIRED COMPONENTS rosruby genrb message_generation)

# generate srv from source
add_service_files(FILES
  TwoInts.srv
  )

generate_messages()

catkin_package(
  DEPENDS rosruby rosruby_actionlib message_runtime
  )

rosruby_setup()

# if you want to generate msg/srv from binary package, 
# rosruby_generate_messages macro is useful.
rosruby_generate_messages(actionlib_tutorials geometry_msgs)

install(PROGRAMS
  nodes/add_two_ints_client.rb
  nodes/add_two_ints_server.rb
  nodes/fibonacci_client.rb
  nodes/fibonacci_server.rb
  nodes/talker.rb
  nodes/listener.rb
  nodes/sample_param.rb
  nodes/sample_log.rb
  nodes/gui.rb
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
  )
