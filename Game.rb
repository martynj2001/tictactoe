# Game Class - an instance represents the Game.

Class Game
{
	attr_accessor :player_1 :player_2 :board

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

	def display_board
		#display the board
	end
	
	def player_move (player, location)
		#Check move is legal - no player already their
		mov = true
		@board.each do {|loc| mov = false if @board[loc] != nil}
		#add players move to the board
		if mov do
			@board[location] = player
		end
	end

}