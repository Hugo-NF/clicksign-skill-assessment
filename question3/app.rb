class Notification
  def initialize(delivery_methods)
    @delivery_methods = delivery_methods
  end

  def deliver
    @delivery_methods.each(&:deliver)
  end
end

class DeliveryMethod
  def deliver
    raise 'Not implemented'
  end
end

class WhatsApp < DeliveryMethod
  def deliver
    puts 'Deliver by WhatsApp'
  end
end

class Email < DeliveryMethod
  def deliver
    puts 'Deliver by Email'
  end
end

puts Notification.new([WhatsApp.new, Email.new]).deliver
