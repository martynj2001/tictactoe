# Tic Tack Toe Cmd line game - TheOdinProject Intermidiate Ruby Project

require "./Game"

puts "-----------------------------"
puts "XXXXXXXX TICTACTOE OOOOOOOOOO"
puts "-----------------------------"
puts "--------- Martyn J ----------"
puts "-----------------------------"
puts

#puts 'Player 1, enter your name: '
#p1_name = gets.chomp 
#puts 'Player 2, enter your name: '
#p2_name = gets.chomp 

Player = Struct.new(:name, :type)
p1 = Player.new("Bob", "0")
p2 = Player.new("Bill", "X")

game = Game.new(p1, p2)
winner = false

while (not winner)
	puts " Player 1 move: "
	loc = gets.chomp.to_i
	game.player_move(p1, loc)
	puts " Player 2 move: "
	loc = gets.chomp.to_i
	game.player_move(p2, loc)
	winner = game.is_winner?
end

