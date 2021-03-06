#!/usr/bin/env ruby

require 'ros'
require 'roscpp_tutorials/TwoInts'

node = ROS::Node.new('sample_service_server')
node.advertise_service('/add_two_ints',
                       Roscpp_tutorials::TwoInts) do |req, res|
  res.sum = req.a + req.b
  node.loginfo("a=#{req.a}, b=#{req.b}")
  node.loginfo("  sum = #{res.sum}")
  true # return for success
end

node.spin
