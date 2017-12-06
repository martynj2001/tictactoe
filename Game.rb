# Game Class - an instance represents the Game.
class Game
	attr_accessor :player_1, :player_2, :board

	def initialize(player_1, player_2)
		@player_1 = player_1
		@player_2 = player_2
		@board = {}
	end

	def is_winner?
		winner = false
		#code to check for winner
		puts "#{player} is the winner!" if winner
	end

	def print_board
		puts board
	end

	def display_board
		# Display the board
		##
		#  1 | 2 | 3
		# -----------
		#  4 | 5 | 6
		# -----------
		#  7 | 8 | 9
		##

		top = [1,2,3]
		middle = [4,5,6]
		bottom = [7,8,9]

		top.each do |p|
			if @board.key?(p)
				print " #{@board[p]}"
				print " |"
			else
				print "  "
				print " | "
			end
		end
		puts
		puts "------------------"
		middle.each do |p|
			if @board.key?(p)
				print " #{@board[p]}"
				print " |"
			else
				print "  "
				print " | "
			end
		end
		puts
		puts "------------------"
		bottom.each do |p|
			if @board.key?(p)
				print " #{@board[p]}"
				print " |"
			else
				print "  "
				print " | "
			end
		end
		puts
	end
	
	def player_move (player, location)
		#Check move is legal - no player already there
		good_move = false
		while (good_move == false)
			if @board.key?(location)
				print "#{player.name} has already pinched that spot, try again: "
				location = gets.chomp.to_i
			else
				@board[location] = player.type
				good_move = true
			end
		end
		display_board
	end
end


