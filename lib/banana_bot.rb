require "levenshtein"

BananaBotState = {}

class BananaBot
  def initialize(message)
    @message = message
    @sender_id = message.sender["id"]
    # puts "Received '#{message.inspect}' from #{message.sender}"
  end

  def message_text
    @message.text
  end

  def state
    BananaBotState[@sender_id] || [:start]
  end

  def set_state(*new_state)
    BananaBotState[@sender_id] = new_state
  end

  def known_fruit
    ["apple", "banana", "clementine", "pear", "plum", "papaya", "tangerine"]
  end

  def call
    case state[0]
    when :start
      reply "Hello. Please name a fruit."
      set_state :fruit
    when :fruit
      if known_fruit.include?(message_text)
        reply "#{message_text} is a nice fruit!"
        set_state :start
      else
        closest_fruit = known_fruit.min_by{|f| Levenshtein.distance(f, message_text)}
        reply "Did you mean #{closest_fruit}? Yes/No"
        set_state :guessing, closest_fruit
      end
    when :guessing
      guess = state[1]
      if message_text =~ /yes/i
        reply "#{guess} is a nice fruit!"
        set_state :start
      elsif message_text =~ /no/i
        reply "Then pick another fruit please."
        set_state :fruit
      else
        reply "Did you mean #{guess}? Yes/No"
      end
    else
      raise "Unknown state: #{state.inspect}"
    end
  end

  def reply(text)
    @message.reply(text: text)
  end
end
