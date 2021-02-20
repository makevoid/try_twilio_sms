class SMS
  @@from = TWILIO_NUMBER

  def initialize
    @client = Twilio::REST::Client.new TWILIO_SID, TWILIO_TOKEN
  end

  def deliver(to:, message:)
    message = @client.messages.create(
      from: @@from,
      to:   to,
      body: message,
    )
    puts "An SMS was sent to #{message.to[0...-4] + "****"}"
    message
  end
end
