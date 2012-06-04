#!/usr/bin/env ruby

require 'ros'
ROS::load_manifest('rosruby_tutorials')
require 'tf/listener'

node = ROS::Node.new('/tf_listener')
tf_listener = Tf::TransformListener.new(node)

r = ROS::Rate.new(1.0)

while node.ok?
  stamp = ROS::Time.new
  tf = tf_listener.lookup_transform('/base', '/hand', stamp)
  if tf 
    node.loginfo("#{tf}")
  end
  r.sleep

end
