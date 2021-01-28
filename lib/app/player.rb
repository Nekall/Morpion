#require 'pry'

class Player
  attr_accessor :name
  attr_accessor :points

#Methode d'attribution des noms et init des scores
  def initialize(name)
    @name = name
    @points = 0
  end
#Méthode show des stats
  def show_state
    print "     #{@name}, signe : #{@sign} "
  end
end
#Classes d'attribution des signes
class Player1 < Player
  attr_accessor :sign
  def initialize(name)
    @sign = ("✘")

    super(name)
  end
end

class Player2 < Player
  attr_accessor :sign
  def initialize(name)
    @sign = ("◎")

    super(name)
  end
end

#binding.pry
#puts "C'est la fin"
