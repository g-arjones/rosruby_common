#!/usr/bin/env ruby

require 'ros'
require 'actionlib/simple_action_client'
require 'actionlib_tutorials/FibonacciAction'

node = ROS::Node.new('/test_simple_action_client')
client = Actionlib::SimpleActionClient.new(node,
                                           '/fibonacci',
                                           Actionlib_tutorials::FibonacciAction)
client.wait_for_server(1.0)

goal = Actionlib_tutorials::FibonacciGoal.new
goal.order = 5
client.send_goal(goal,
                 :feedback_callback => proc {|feedback|
                   node.loginfo("feedback = [#{feedback.sequence.join(",")}]")
                 })

result = client.wait_for_result(10.0)
node.loginfo("result = #{result.sequence.join(",")}")
