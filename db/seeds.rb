Speaker.create({first_name: "Dani", last_name: "Zaghian", email: "danielle@actualize.co"})
10.times do
Speaker.create({first_name: FFaker::Name::first_name, last_name: FFaker::Name::last_name, email: FFaker::Internet::email})
end