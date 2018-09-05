Speaker.create({first_name: "Dani", last_name: "Zaghian", email: "danielle@actualize.co"})
10.times do
Speaker.create({first_name: FFaker::Name::first_name, last_name: FFaker::Name::last_name, email: FFaker::Internet::email})
end

Meeting.create({title: "Annual Review", agenda: "Review current performance, set goals, employee feedback.", time: "10:00 AM"})
Meeting.create({title: "Skills Assessment", agenda: "Practive exercises, verbal questions, pass/fail.", time: "2:30 PM"})