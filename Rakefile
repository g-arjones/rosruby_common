import 'rosruby_actionlib/Rakefile'
import 'rosruby_tf/Rakefile'

task :default do
  # for ci use different URI for parallel test.
  if ENV['TRAVIS'] == 'true'
    ENV['ROS_MASTER_URI'] = "http://127.0.0.1:#{11311+$$}/"
  end
  require "ros/roscore"
  thread = Thread.new do
    ROS::start_roscore
  end
  ROS::wait_roscore

  chdir('rosruby_actionlib') do
    Rake::Task["actionlib:test_without_master"].invoke
  end
  chdir('rosruby_tf') do
    Rake::Task["tf:test_without_master"].invoke
  end
  Thread::kill(thread)
end
