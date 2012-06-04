#!/usr/bin/env ruby

require 'ros'
ROS::load_manifest('rosruby_tutorials')
require 'tf/broadcaster'

node = ROS::Node.new('/tf_broadcaster')
tf_broadcaster = Tf::TransformBroadcaster.new(node)

r = ROS::Rate.new(1.0)
while node.ok?
  now = ROS::Time.now
  tf_broadcaster.send_transform([0.1, 0.0, 0.0],
                                [0.0, 0.0, 0.0, 1.0],
                                now,
                                '/shoulder', '/base')
  tf_broadcaster.send_transform([0.0, -0.2, 0.0],
                                [0.0, 0.0, 0.0, 1.0],
                                now,
                                '/hand', '/shoulder')
  tf_broadcaster.send_transform([0.0, 0.1, 0.1],
                                [0.0, 0.0, 0.0, 1.0],
                                now,
                                '/hand', '/head')

  r.sleep

end
