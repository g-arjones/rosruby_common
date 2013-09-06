#!/usr/bin/env ruby

require 'ros'
require 'actionlib/simple_action_server'
require 'actionlib_tutorials/FibonacciAction'

node = ROS::Node.new('/test_simple_action_server')
server = Actionlib::SimpleActionServer.new(node,
                                           '/fibonacci',
                                           Actionlib_tutorials::FibonacciAction)
server.start do |goal|
  feedback = Actionlib_tutorials::FibonacciFeedback.new
  feedback.sequence = [0, 1]
  r = ROS::Rate.new(1.0)
  for i in 1..goal.order
    feedback.sequence.push(feedback.sequence[i] + feedback.sequence[i-1])
    server.publish_feedback(feedback)
    node.loginfo("feedback = [#{feedback.sequence.join(",")}]")
    r.sleep
  end
  result = Actionlib_tutorials::FibonacciResult.new
  result.sequence = feedback.sequence
  server.set_succeeded(result)
end

node.spin
