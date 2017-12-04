# Game Class - an instance represents the Game.

Class Game
{
	attr_accessor :player_1 :player_2

	def initialize(player_1, player_2)
	{
		@player_1 = player_1
		@player_2 = player_2
	}

	def is_winner?
	{
		winner = false
		#code to check for winner
		puts "#{player} is the winner!" if winner
	}

	def display_board
	{
		#display the board
	}

}