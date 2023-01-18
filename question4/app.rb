class SendWorker
  def call
    puts 'Executa ação TIPO1'
  end
end

class ReceiveWorker
  def call
    puts 'Executa ação TIPO2'
  end
end

class Action
  WORKERS = {
    send: SendWorker.new,
    receive: ReceiveWorker.new
  }.freeze

  def initialize(type)
    @type = type
  end

  def call
    WORKERS[@type].call
  end
end

Action.new(:send).call
