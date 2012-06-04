rosruby_common
==============

rosruby common libraries (tf/actionlib/tutorial).
These are experimental now.

tf
--------------------

[tf](http://ros.org/wiki/tf) is ROS's basic multiple coordinate frames system.
rosruby_tf supports basic functions of tf.


### broad cast sample ###

```ruby
#!/usr/bin/env ruby

require 'ros'
ROS::load_manifest("rosruby_tf")

node = ROS::Node.new('/tf_test')
tf_broadcaster = Tf::TransformBroadcaster.new(node)
now = ROS::Time::now
tf_broadcaster.send_transform([1.0, 2.0, 3.0], [0.0,0.0,0.0,1.0], now, '/child', '/parent')

```

### listener sample ###
```ruby

```

actionlib
---------------
[actionlib](http://ros.org/wiki/actionlib) provides a standardized interface for interfacing with preemptible tasks.


### simple action server ###

```ruby
```

### simple action client ###

```ruby

```
