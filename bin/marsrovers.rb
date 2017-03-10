#!/bin/env ruby

require_relative '../lib/mission'

m = MarsRover::Mission.new(STDIN)
m.process

m.rover_results.each do |result| 
  puts result
end
