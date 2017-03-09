#!/bin/env ruby

include-relative 'lib/rover'

m = Mission.new STDIN

m.set_plateau

while !m.input.eof?
  r = Rover.new m.get_next_rover_config
   
