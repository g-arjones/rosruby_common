rosruby_common
==============

[rosruby](https://github.com/OTL/rosruby) common libraries (tf/actionlib/tutorial).
rosruby_tutorials contains samples of rosruby.

actionlib
---------------
[actionlib](http://ros.org/wiki/actionlib) provides a standardized interface for interfacing with preemptible tasks.


### simple action server ###

```ruby
#!/usr/bin/env ruby

require 'ros'
ROS::load_manifest("rosruby_actionlib")
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
```

### simple action client ###

```ruby
#!/usr/bin/env ruby

require 'ros'
ROS::load_manifest("rosruby_actionlib")
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
```
