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

		#Check move is legal - not greater than 9 and no player already there
		good_move = false
		while (good_move == false)
			if location.between?(1,10)
				if @board.key?(location)
					print "#{player.name} has already pinched that spot, try again: "
					location = gets.chomp.to_i
				else
					@board[location] = player.type
					good_move = true
				end
			else
				print "Not a valid place - must be between 1 - 9 and not already occupied, try again: "
				location = gets.chomp.to_i
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
		if check_winner?(@player_1) || check_winner?(@player_2)
			@game_won = true
		else
			@game_won = false		
		end
	end
	
	def check_winner?(player)
		places = []
		@board.each do |loc, type|
			if type == player.type
				places << loc
			end
		end

		return false if places.length < 3

		puts "places - #{places}"

		if places.include?([1,2,3]) #|| places.include?(4 && 5 && 6) || places.include?(7 && 8 && 9)
			@winner = player.name
			puts " #{player.name} - row"
			return true
		elsif places.include?(1 && 4 && 7) || places.include?(2 && 6 && 8) || places.include?(3 && 7 && 9)
			@winner = player.name
			puts " #{player.name} - column"
			return true
		elsif places.include?(1 && 5 && 9) || places.include?(7 && 5 && 3)
			@winner = player.name
			puts " #{player.name} - diagonal"
			return true	
		else
			return false
		end
	end
	
	private :display_board, :is_winner?, :check_winner?
end


