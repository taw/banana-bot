require_relative "../lib/banana_bot"

class MockMessage
  attr_reader :replies

  def initialize(text)
    @text = text
    @replies = []
  end

  def reply(text)
    @replies << text
  end
end
