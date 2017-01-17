require "facebook/messenger"
include Facebook::Messenger
require_relative "lib/banana_bot"
# NOTE: ENV variables should be set directly in terminal for testing on localhost

# Subcribe bot to your page
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :message do |message|
  BananaBot.new(message).call
end
