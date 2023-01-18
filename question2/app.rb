class Notification
  def initialize(delivery_method)
    @delivery_method = delivery_method
  end

  def deliver
    @delivery_method.deliver
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

puts Notification.new(WhatsApp.new).deliver
