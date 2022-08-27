require_relative "animal"

class Warthog < Animal
  def talk
    return "#{@name} grunts"
  end
end
