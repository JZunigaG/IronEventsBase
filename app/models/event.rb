

class Event < ActiveRecord::Base

	belongs_to :user

	has_many :comments
	
	has_many :rsvps

	has_many :users,through: :rsvps


	# Usamos gema friendlyid
	extend FriendlyId

	# El nombre de la variable a usar como slugged,en la URL ponemos
	# //localhostt:3000/events/nombre_evento 
	#friendly_id :name,use: :slugged

	friendly_id :slug_candidates,use: :slugged

	validates :name, presence: true, length: { maximum: 60 }

	validates_length_of :description, minimum: 10, allow_blank: true

	validates :user, presence: true

	validates :start_at, presence: true
	validates :end_at, presence: true


	scope :for_today, ->(){
		where(["DATE(start_at) <= DATE(?) AND DATE(?) <= DATE(end_at)", Date.today, Date.today])
	}

	scope :next_week,->(){
		start = Date.today.next_week

		last = start.end_of_week		

		where(["DATE(start_at) <= DATE(?) AND DATE(?) <= DATE(end_at)",last,start])
	}

	scope :name_like, lambda { |name|
		where(["name like ?", "%#{name}%"])
	}

	# le damos varias opciones para si hay colisiones tenga mas opciones para 
	# discriminar,primero cogeria :name ,si hay 2 nombres iguales ,cogeria tambien 
	# la fecha de start y asi sucesivamente
	def slug_candidates
		[
			:name,

		 	[:name,:start_at],
		 	
		 	[:name,:start_at,:end_at]
		]
	end


	# Metodo get
	def price_in_euros

		(price || 0) / 100.0

	end

	# Metodo set,cuando lleva un =
	def price_in_euros=(value)

		self.price = value.to_f * 100

	end


	private

	def start_at_is_present

		if start_at.blank?

			errors.add(:start_at, "debes introducir la fecha de inicio")

		end

	end

end
