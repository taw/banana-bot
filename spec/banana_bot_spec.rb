require_relative "spec_helper"

describe "Bot" do
  let(:conversation) { MockConversation.new }

  it "says hello" do
    expect(conversation.say("hello")).to eq(["Hello. Please name a fruit."])
  end

  it "when you name correct fruit" do
    expect(conversation.say("hello")).to eq(["Hello. Please name a fruit."])
    expect(conversation.say("banana")).to eq(["banana is a nice fruit!"])
  end

  it "when you name incorrect fruit - yes" do
    expect(conversation.say("hello")).to eq(["Hello. Please name a fruit."])
    expect(conversation.say("papayya")).to eq(["Did you mean papaya? Yes/No"])
    expect(conversation.say("Yes")).to eq(["papaya is a nice fruit!"])
  end

  it "when you name incorrect fruit - no" do
    expect(conversation.say("hello")).to eq(["Hello. Please name a fruit."])
    expect(conversation.say("papayya")).to eq(["Did you mean papaya? Yes/No"])
    expect(conversation.say("No")).to eq(["Then pick another fruit please."])
  end

  it "when you name incorrect fruit - something else" do
    expect(conversation.say("hello")).to eq(["Hello. Please name a fruit."])
    expect(conversation.say("papayya")).to eq(["Did you mean papaya? Yes/No"])
    expect(conversation.say("lol")).to eq(["Did you mean papaya? Yes/No"])
  end
end
