cmake_minimum_required(VERSION 2.8.3)
project(rosruby_actionlib)

find_package(catkin REQUIRED COMPONENTS rosruby)

rosruby_setup()

set(ROSRUBY_MSGS actionlib_msgs)
if (CATKIN_ENABLE_TESTING)
  list(APPEND ROSRUBY_MSGS actionlib_tutorials)
endif()

rosruby_generate_messages(${ROSRUBY_MSGS})

catkin_package(
  CATKIN_DEPENDS rosruby actionlib_msgs
  )

rosruby_add_libraries(
  lib/actionlib)

install(DIRECTORY lib/
  DESTINATION ${ROSRUBY_LIB_DESTINATION}
  )
