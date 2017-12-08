# Game Class - an instance represents the Game.
class Game
	attr_accessor :player_1, :player_2, :board, :winner, :game_won

	def initialize(player_1, player_2)
		@player_1 = player_1
		@player_2 = player_2
		@board = {}
		@game_won = false
		@winner = nil
	end

	def print_board
		puts board
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
		is_winner?
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
	
	def is_winner?
		if check_winner(@player_1) || check_winner(@player_2)
			@game_won = true
		else
			@game_won = false		
		end
		
		# Check @player_1 and @player_2 seperately (maybe new class method)
		# Make array of locations for all @player_1 hash keys
		# Use case statement to check array for any winning combinations (there are 8)
		# 123,456,789 147,258,369 159,753
		
	end
	
	def check_winner?(player)
		# Code to check for winner
		# Check the board for winning combinations
		
		places = []
		@board.each do |loc, type|
			if type = player.type
				places << loc
			end
		end
		
		return false if places.length < 3
		
		places.combination(3) do |a|
			a.permutation do |p|
				case  p
					when [1,2,3] then
						return true
						@winner = player.name
					when [4,5,6] then
						return true
						@winner = player.name
					when [7,8,9] then
						return true
						@winner = player.name
					when [1,4,7] then
						return true
						@winner = player.name
					when [2,5,8] then
						return true
						@winner = player.name
					when [3,6,9] then
						return true
						@winner = player.name
					when [1,5,9] then
						return true
						@winner = player.name
					when [7,5,3] then
						return true
						@winner = player.name
					else
						return false
				end
			end
		end
	end
	
	
	private :display_board, :is_winner?, :check_winner?
	
end


