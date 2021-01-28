require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/game'
require 'app/player'
require 'app/boardcase'
require 'views/show'



  #introduction

  #Creation des joueurs & points
  puts "Le 1er joueurs peut entrer son pseudo :"
  player1 = gets.chomp
  puts "Le 2eme joueur peut entrer son pseudo :"
  player2 = gets.chomp

#Boucle de restart#{@points}
while true
  #Creation  de la partie
  my_game = Game.new(player1, player2)

  #Affichage des stats en début de round
  my_game.get_stats


  system('clear')
  my_game.get_stats
  my_game.show_board

  #Boucle de rounds
  while true
    #Selection d'une case par le joueur 1
    my_game.case_selection_for1
    #C'est gagné ou pas ?
    if((my_game.victory) == true)
      then my_game.victory_message(1)
          break
    end

    #check si match nul
    if((my_game.equality) == true)
      then break
    end

    system('clear')
    my_game.get_stats
    my_game.show_board

    #Selection d'une case par le joueur 2
    my_game.case_selection_for2
    #C'est gagné ou pas ?
    if((my_game.victory) == true)
      then my_game.victory_message(2)
          break
    end
    #check si match nul
    if((my_game.equality) == true)
      then break
    end
    system('clear')
    my_game.get_stats
    my_game.show_board
  end

  system('clear')
  my_game.get_stats
  my_game.show_board
  puts "PARTIE TERMINE"
  puts " "
  puts "Veux tu rejouer ? "
  puts "o : Si oui | n : Si non"
  answer = gets.chomp
  if(answer == "o")
    else abort("Merci d'avoir joué à notre Tic-Tac-Toe ♡")
  end
end
#binding.pry
#puts "C'est la fin"
