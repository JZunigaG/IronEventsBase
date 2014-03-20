# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
6.times do |i|

	event = Event.create name: "IronHack #{i}",description: "",start_at: Date.today,end_at: Date.today + i.days,address: "",user: 1
	
end
