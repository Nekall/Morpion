#require 'pry'

class Play_case

  attr_accessor :board

#Initialise l'array qui constitue le board
  def initialize
    @board = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
  end
#Remplace la case selectionné par une croix
  def replace_by_cross(selecase)
    if(@board.include?(selecase) == true)
      then @board.map! do |c|
            if(c == selecase)
              then c = "✘ "
              else c = c
            end
          end
      else puts "Case deja selectionné"
          sleep(1)
    end
  end
#Remplace la case selectionné par un cercle
  def replace_by_circle(selecase)
    if(@board.include?(selecase) == true)
      then @board.map! do |c|
            if(c == selecase)
              then c = "◎ "
              else c = c
            end
          end
      else puts "Case deja selectionné"
          sleep(1)
    end
  end
#Affiche du board
  def to_s
    @array_copy = @board.map do |check|
      if(check != "◎ " && check != "✘ ")
        then (check = "  ")
      else check = check
      end
    end
    puts " "
    puts "                ╔═══╦═══╦═══╗"
    puts "                ║ 1 ║ 2 ║ 3 ║"
    puts "            ╔═══╬═══╬═══╬═══╣"
    puts "            ║ A ║ #{@array_copy[0..2].join("║ ")}║"
    puts "            ╠═══╬═══╬═══╬═══╣"
    puts "            ║ B ║ #{@array_copy[3..5].join("║ ")}║"
    puts "            ╠═══╬═══╬═══╬═══╣"
    puts "            ║ C ║ #{@array_copy[6..8].join("║ ")}║"
    puts "            ╚═══╩═══╩═══╩═══╝"
    puts " "
  end
#Méthode c'est gagné en horizontale ?
  def check_win_in_horizon?
    if(@board[0] == @board[1] && @board[1] == @board[2])
      then return true
    end
    if(@board[3] == @board[4] && @board[4] == @board[5])
      then return true
    end
    if(@board[6] == @board[7] && @board[7] == @board[8])
      then return true
    end
  end
#Méthode c'est gagné en horizontale ?
  def check_win_in_vertical?
    if(@board[0] == @board[3] && @board[3] == @board[6])
      then return true
    end
    if(@board[1] == @board[4] && @board[4] == @board[7])
      then return true
    end
    if(@board[2] == @board[5] && @board[5] == @board[8])
      then return true
    end
  end
#Méthode c'est gagné en diagonale ?
  def check_win_in_diagonal?
    if(@board[0] == @board[4] && @board[4] == @board[8])
      then return true
    end
    if(@board[2] == @board[4] && @board[4] == @board[6])
      then return true
    end
  end
end
#binding.pry
#puts "C'est la fin"
