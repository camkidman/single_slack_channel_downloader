require 'rubygems'
require 'httparty'
require 'pry'

url = ARGV[0]
token = ARGV[1]
channel_id = ARGV[2]

slack_response = HTTParty.get(url + "/channels.history", :query => { :token => token, :channel => channel_id })
message_array = []

def parsed_user(user_id, url, token)
  user_response = HTTParty.get(url + "/users.info", :query => { :token => token, :user => user_id })
  user_response["user"]["name"]
end

loop do
  slack_response["messages"].each do |message|
    message_array << { :user => parsed_user(message["user"], url, token), :message => message["text"] }
  end
  break if slack_response["has_more"] == false
  slack_response = HTTParty.get(url + "/channels.history", :query => { :token => token, :channel => channel_id, :latest => slack_response["messages"].last["ts"]})
end

File.open("messages.json", "w") { |file| file.write(message_array.to_json) }
