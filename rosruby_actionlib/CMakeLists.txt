cmake_minimum_required(VERSION 2.8.3)
project(rosruby_actionlib)

find_package(catkin REQUIRED COMPONENTS rosruby)

rosruby_setup()

rosruby_generate_messages(actionlib_msgs)

catkin_package(
  CATKIN_DEPENDS rosruby
  )

rosruby_add_libraries(
  lib/actionlib)

install(DIRECTORY lib/
  DESTINATION ${ROSRUBY_LIB_DESTINATION}
  )
