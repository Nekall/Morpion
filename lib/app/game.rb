#require 'pry'

class Game
  include Enumerable
  attr_accessor :player
#Méthode d'initialisation
  def initialize(player1, player2)
    @player1 = Player1.new(player1)
    @player2 = Player2.new(player2)
    @board = Play_case.new
  end
#Méthode selection de la case pour le joueur 1
  def case_selection_for1
    puts "C'est a #{@player1.name} de jouer ✘"
    puts "Quelle case veux tu prendres ?"
    print ">"
    selecase = gets.chomp
    @board.replace_by_cross(selecase)
  end
#Méthode selection de la case pour le joueur 2
  def case_selection_for2
    puts "C'est a #{@player2.name} de jouer ○"
    puts "Quelle case veux tu prendres ?"
    print ">"
    selecase = gets.chomp
    @board.replace_by_circle(selecase)
  end

  def show_board
    @board.to_s
  end
#Methode affichage des stats des joueurs
  def get_stats
    puts " ┌───────────────────────────────────────┐"
    puts "        #{@player1.show_state}"
    puts "        #{@player2.show_state}"
    puts " └───────────────────────────────────────┘"
  end

  def victory
    if(@board.check_win_in_horizon? == true)
      then return true
    end
    if(@board.check_win_in_vertical? == true)
      then return true
    end
    if(@board.check_win_in_diagonal? == true)
      then return true
    end
  end

end

#binding.pry
#puts "C'est la fin"
