Category.all.each do |c| 
	c.delete
end

[ "Tennis",\
"Soccer",\
"Baseball",\
"Football",\
"Volleyball",\
"Beach Volleyball",\
"Swimming",\
"Kite Surfing",\
"Skiing & Snowboarding",\
"Skateboarding",\
"Fencing",\
"Basketball",\
].each do |os|
  Category.find_or_create_by_name(os)
end

if Rails.env.development?

	Venue.all.each do |b| 
		b.delete
	end


	[ "Fallon Sports Park",\
	 "Erman Backyard",\
	].each do |os|
	  Venue.find_or_create_by_name(os)
	end

end

if !Rails.env.development?

	[ "Erman Backyard",\
	].each do |os|
	  Venue.find_or_create_by_name(os).delete
	end

end