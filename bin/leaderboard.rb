def leaderboard board_name,reversed=true

	Leaderboard.new self,board_name,reversed

end

class Leaderboard

	attr_reader :conn, :board_name

	# reversed? = true => higher score first
	def initialize conn,board_name,reversed=true

		@conn = conn

		@board_name = board_name

		@reversed = reversed

	end


	def reversed?

		@reversed

	end


	def rank_member score,member

		conn.zadd(board_name,score,member) 

	end


	def change_score_for member,delta

		conn.zincrby(board_name,delta,member) 

	end


	def rank_for member

		to_rank(reversed? ? conn.zrevrank(board_name,member) : conn.zrank(board_name,member))

	end


	private

	def to_rank(rank)

		rank.nil? ? nil : (rank + 1)
	end

end