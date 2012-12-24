raise "Missing url argument to this Ruby script" unless ARGV[0]

require 'rubygems'
require 'json'
require 'open-uri'

# Configuration Variables
PHANTOMJS_BIN = `which phantomjs`
PHANTOMJS_OPTS = "yslow.js --info all #{ARGV[0]}"

yslow_command = "#{PHANTOMJS_BIN.gsub("\n","")} #{PHANTOMJS_OPTS}"
puts "! About to execute: #{yslow_command}"

yslow_output = JSON.parse(`#{yslow_command}`)
puts "! Successfully executed PhantonJS command\n"

# print out all YSlow output in readable JSON format
# require 'pp'
# pp yslow_output

puts "TOTAL PAGE SIZE: #{yslow_output["w"].to_i/1024}kb\n\n"
yslow_output["stats"].each do |type,stats|
  puts "+ #{type.upcase}: #{stats["w"].to_i/1024}kb (over #{stats["r"]} requests)\n"
  yslow_output["comps"].each do |comp| # TODO: make more efficient
    if comp["type"] == type
      puts "  - #{URI.decode(comp["url"])}: #{comp["size"]/1024}kb (#{comp["size"]}ms response time)"
    end
  end
end
