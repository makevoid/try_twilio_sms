class SMS
  @@from = TWILIO_NUMBER

  def initialize
    @client = Twilio::REST::Client.new TWILIO_SID, TWILIO_TOKEN
  end

  def deliver(number, message)
    message = @client.account.messages.create(
      from: @@from,
      to: number,
      body: message,
    )
    puts "An SMS was sent to #{message.to[0...-4] + "****"}"
    message
  end
end
