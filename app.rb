require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/game'
require 'app/player'
require 'app/boardcase'
require 'views/show'



  #introduction visuel

  #Creation des joueurs & points
  puts " "
  puts "Quel est le pseudo du joueur voulant les ✘ ?"
  player1 = gets.chomp
  puts "Quel est le pseudo du joueur voulant les ❍ ?"
  player2 = gets.chomp

#Boucle de restart#{@points}
while true
  #Creation  de la partie
  my_game = Game.new(player1, player2)

  #Affichage des stats en début de round
  my_game.get_stats

  #Clean et affichage
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
          sleep(3)
          break
    end

    #Check si le match est nul
    if((my_game.equality) == true)
      then break
    end
    #Clean et affichage
    system('clear')
    my_game.get_stats
    my_game.show_board

    #Selection d'une case par le joueur 2
    my_game.case_selection_for2
    #C'est gagné ou pas ?
    if((my_game.victory) == true)
      then my_game.victory_message(2)
          sleep(3)
          break
    end
    #check si match nul
    if((my_game.equality) == true)
      then break
    end
    #Clean et affichage
    system('clear')
    my_game.get_stats
    my_game.show_board
  end
  #Clean et affichage
  system('clear')
  my_game.get_stats
  my_game.show_board
  puts "PARTIE TERMINE"
  puts " "
  puts "Voulez vous rejouer ? "
  puts "o : Si oui | n : Si non"
  answer = gets.chomp
  if(answer == "o")
    else abort("Merci d'avoir joué à notre Tic-Tac-Toe ♡ ")
  end
end
#binding.pry
#puts "C'est la fin"
