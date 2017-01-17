require_relative "../lib/banana_bot"

class MockConversation
  def initialize
    @sender = {"id" => rand}
  end

  def say(text)
    message = mock_message(text)
    BananaBot.new(message).call
    message.replies
  end

private

  def mock_message(text)
    MockMessage.new(text, @sender)
  end
end

class MockMessage
  attr_reader :replies, :sender, :text

  def initialize(text, sender)
    @text = text
    @sender = sender
    @replies = []
  end

  def reply(text:)
    @replies << text
  end
end
