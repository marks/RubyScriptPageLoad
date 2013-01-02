require 'rubygems'
require 'open-uri'
require 'sinatra'
require 'json'

# Configuration Variables
PHANTOMJS_BIN = `which phantomjs`


get '/' do
  redirect '/index.html'
end

get '/page_weight' do
  url = params[:url]
  redirect '/' unless params[:url]

  phantomjs_opts = "yslow.js --info all #{url}"
  yslow_command = "#{PHANTOMJS_BIN.gsub("\n","")} #{phantomjs_opts}"
  yslow_output = JSON.parse(`#{yslow_command}`)

  output = {}
  output["total_kb"] = yslow_output["w"].to_i/1024
  yslow_output["stats"].each do |type,stats|
    output << "+ #{type.upcase}: #{stats["w"].to_i/1024}kb (over #{stats["r"]} requests)\n"
    yslow_output["comps"].each do |comp| # TODO: make more efficient
      if comp["type"] == type
        output << "  - #{URI.decode(comp["url"])}: #{comp["size"]/1024}kb (#{comp["size"]}ms response time)"
      end
    end
  end
  return output.join("\n")

end
