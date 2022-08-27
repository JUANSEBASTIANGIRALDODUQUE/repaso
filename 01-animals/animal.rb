class Animal
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def self.phyla
    return ["Deuterostomia", "Ecdysozoa", "Lophotrochozoa", "Radiata"]
  end

  def eat(food)
    "#{name} eats a #{food}"
  end
end
