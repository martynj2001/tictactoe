#Class player - an instance is created to represent a player in tictactoe.

Class player
{
	attr_accessor  :type :name

	def initialize (type, name)
	{
		@type = type
		@name = name
	}
	
}