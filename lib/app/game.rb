#require 'pry'

class Game
  attr_accessor :player
  attr_accessor :counter

#Méthode d'initialisation
  def initialize(player1, player2)
    @player1 = Player1.new(player1)
    @player2 = Player2.new(player2)
    @board = Play_case.new
    @counter = 0
  end
#Méthode selection de la case pour le joueur 1
  def case_selection_for1
    puts "C'est a #{@player1.name} de jouer ✘"
    puts "Quelle case veux tu prendres ?"
    while true
    print ">"
      selecase = gets.chomp
      if(selecase == "A1" or selecase == "A2" or selecase == "A3" or selecase == "B1" or selecase == "B2" or selecase == "B3" or selecase == "C1" or selecase == "C2" or selecase == "C3")
        then break
      else puts "Ce n'est pas une case valide！"
           puts "Quelle case veux tu prendres ?"
      end
    end
    @board.replace_by_cross(selecase)
  end
#Méthode selection de la case pour le joueur 2
  def case_selection_for2
    puts "C'est a #{@player2.name} de jouer ❍"
    puts "Quelle case veux tu prendres ?"
    while true
    print ">"
      selecase = gets.chomp
      if(selecase == "A1" or selecase == "A2" or selecase == "A3" or selecase == "B1" or selecase == "B2" or selecase == "B3" or selecase == "C1" or selecase == "C2" or selecase == "C3")
        then break
        else puts "Ce n'est pas une case valide！"
             puts "Quelle case veux tu prendres ?"
      end
    end
    @board.replace_by_circle(selecase)
  end
#Affichage du board
  def show_board
    @board.to_s
  end
#Methode affichage des stats des joueurs
  def get_stats
    puts " ┌───────────────────────────────────────┐"
    puts "      #{@player1.show_state}"
    puts "      #{@player2.show_state}"
    puts " └───────────────────────────────────────┘"
  end
#Methode de victoir
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
#Méthode message de victoir
  def victory_message(player)
    if(player == 1)
      then puts "Bravo, #{@player1.name}, tu as gagné !"
      else puts "Bravo, #{@player2.name}, tu as gagné !"
    end
  end
#Méthode, match nul
  def equality
    @counter = (@counter + 1)
    if(@counter == 9)
      then puts "MATCH NUL"
            sleep(2)
          return true
    end
  end
end

#binding.pry
#puts "C'est la fin"
