class BananaBot
  def initialize(message)
    @message = message
  end

  def call
    reply "Hello. I am banana bot and I love bananas."
  end

  def reply(text)
    p [:whatsup, @message, text]
    @message.reply(text)
  end
end
