# Game Class - an instance represents the Game.
class Game
	attr_accessor :player_1, :player_2, :board, :winner, :game_won
	
	@@winning_rows = [[1,2,3],[4,5,6],[7,8,9]]
	@@winning_cols = [[1,4,7],[2,5,8],[3,6,9]]
	@@winning_digs = [[1,5,9],[3,5,6]]

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
		
		#get player types for each location held in winning_combos_row[]
		winners_r, winners_c, winners_d = []
		@board.each do |loc, type|
			#Check if in row
			@@winning_rows.each do |row|
				row.each {|p| winners_r[row[p]] << player.type if p == loc}	
			end
			@@winning_cols.each do |col|
				col.each {|p| winners_c[col[p] << player.type if p == loc}
			end
			@@winning_digs.each do |dig|
				dig.each {|p| winners_d[dig[p] << player.type if p == loc}
			end
		end
		
		#Check for winners
		3.times{p_type << player.type}
		#Rows
		@@winning_rows.each do |r|
			if r == p_type
				 @winner = player.name
				 return true
			end
		end
		#Columns
		@@winning_cols.each do |c|
			if c == p_type
				@winner = player.name
				return true
			end
		end
		#Diagonals
		@@winning_digs.each do |d|
			if d == p_type
				@winner = player.name
				return true
			end
		end
	end
	
	private :display_board, :is_winner?, :check_winner?
end


