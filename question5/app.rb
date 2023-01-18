class Person
  attr_accessor :document # In a rails app this would be a ActiveRecord class

  def initialize(document)
    @document = document
  end
end

class NaturalPerson < Person
  def validate
    puts "validates document as CPF: #{@document}"
  end
end

class LegalPerson < Person
  def validate
    puts "validates document as CNPJ: #{@document}"
  end
end

puts NaturalPerson.new('059.851.171-78').validate
