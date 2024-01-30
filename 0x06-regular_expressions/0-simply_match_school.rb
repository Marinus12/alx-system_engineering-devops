#!/usr/bin/env ruby
#A regular expression that matches with School

input = ARGV[0]
pattern = /School/
matches = input.scan(pattern)
puts matches.join('')
