#!/usr/bin/env ruby

def extract_info(log_line)
	match = log_line.match(/\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/)
	if match
		sender = match[1]
		receiver = match[2]
		flags = match[3]
		return "#{sender},#{receiver},#{flags}"
	else
		return nil
	end
end

ARGF.each do |line|
	if line.include?("Receive SMS") || line.include?("Sent SMS")
		info = extract_info(line)
		puts info if info
	end
end
