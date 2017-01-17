require_relative "spec_helper"

describe "Bot" do
  it "says hello" do
    message = MockMessage.new("hello")
    bot = BananaBot.new(message).call
    expect(message.replies).to eq(
      ["Hello. I am banana bot and I love bananas."]
    )
  end
end
