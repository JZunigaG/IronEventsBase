#ejecucion last_n 5
#10.times { |i| i + 1}

def last_n n

	KeepLastN.new self,n

end

class KeepLastN

	attr_reader :conn, :limit

	def initialize conn,n

		@conn = conn

		@limit = n
	end

	# complete signature,añadir elementos a una lista con un tamaño maximo,si 
	#llegamos al maximo hacer pop
	def push(key,value) 

		# Se hace una transaccion 
		conn.multi do

			conn.lpush(key,value)

			conn.ltrim(key,0,limit - 1)

		end

	end

end