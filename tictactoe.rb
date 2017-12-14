# Tic Tack Toe Cmd line game - TheOdinProject Intermidiate Ruby Project

require "./Game"

puts "-----------------------------"
puts "XXXXXXXX TICTACTOE OOOOOOOOOO"
puts "-----------------------------"
puts "--------- Martyn J ----------"
puts "-----------------------------"
puts
puts  " 1 | 2 | 3 "
puts  "-----------"
puts  " 4 | 5 | 6 "
puts  "-----------"
puts  " 7 | 8 | 9 "
puts

puts 'Player 1, enter your name: '
p1_name = gets.chomp
puts 'Player 2, enter your name: '
p2_name = gets.chomp

Player = Struct.new(:name, :type)
p1 = Player.new(p1_name, "0")
p2 = Player.new(p2_name, "X")

game = Game.new(p1, p2)

while (game.game_won == false)
	puts "#{p1.name} move: "
	loc = gets.chomp.to_i
	game.player_move(p1, loc)
	if game.game_won
		break
	else
		puts "#{p2.name} move: "
		loc = gets.chomp.to_i
		game.player_move(p2, loc)
	end
end

puts "#{game.winner} has won the game"
