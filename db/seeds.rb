# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hh = User.create({username: "hollyhawthorn", email: "hollyh@email.com", password: "druidsrock"})
sa = User.create({username: "serynarweiniad", email: "seryna@email.com", password: "clericsrock"})
ts = User.create({username: "tealstagheart", email: "teals@email.com", password: "warlocksrock"})
oi = User.create({username: "opheliainkwell", email: "opheliai@email.com", password: "wizardsrock"})

hike = Category.create({name: "Hiking"})
garden = Category.create({name: "Gardening"})
part = Category.create({name: "Performing Arts"})
date = Category.create({name: "Dating"})
food = Category.create({name: "Food & Drink"})
charity = Category.create({name: "Charity & Causes"})
music = Category.create({name: "Music"})
dance = Category.create({name: "Dance"})
education = Category.create({name: "Education"})
crafting = Category.create({name: "Crafts"})


pfp = Event.create({name: "Planting for Pollinators", 
description: "Do you want to grow plants that are perfect for pollinators? Your garden can be a haven for wildlife as well as providing the ideal home for bees, butterflies and all pollinators, which are so important to us because they pollinate crops, help plants grow and are themselves a food source for birds and mammals. The flowers you choose to plant are vital in encouraging all wildlife into your garden. With a little thought and planning, you can provide much pollen and nectar for pollinators throughout the year.", 
location: "Tom's Thumb Nursery", 
start_date: "2021-03-06", 
end_date: "2021-03-06",
start_time: "13:00:00",
end_time: "14:00:00", 
user_id: hh.id, 
category_id: garden.id})

spw = Event.create({name: "Succulent Propogation Workshop", 
description: "Join plant expert Holly Hawthorn for her monthly Succulent Propagation Workshop! Learn how to make your succulent multiply. Attendees will receive a free succulent and pot. Happy Planting!",
location: "Tom's Thumb Nursery", 
start_date: "2021-03-24", 
end_date: "2021-03-24",
start_time: "18:00:00",
end_time: "19:00:00", 
user_id: hh.id, 
category_id: garden.id})

nw = Event.create({name: "Nature Walk", 
description: "Take a trip through nature with environmental preservationist Teal Stagheart! The hike will run approximately 5 miles through the Armand Bayou Nature Center.",
location: "Armand Bayou Nature Center", 
start_date: "2021-02-27", 
end_date: "2021-02-27",
start_time: "09:00:00",
end_time: "12:00:00", 
user_id: ts.id, 
category_id: hike.id})

ntt = Event.create({name: "Notetaking Tips & Tricks", 
description: "Study more efficiently with better notetaking! Perpetual student Seryn Arweinaid will show you her top tips and tricks to taking better notes during class, and how to use those notes to study.",
location: "Online", 
start_date: "2021-02-25", 
end_date: "2021-02-25",
start_time: "15:00:00",
end_time: "16:00:00", 
user_id: sa.id, 
category_id: education.id})

shg = Event.create({name: "Studying for Higher Grades", 
description: "Studying is hard. But with the right tools and attitude, you can master the art of studying and imrpove your grades! Join Seryn Arweinaid for a workshop on how to study to get higher grades.",
location: "Online", 
start_date: "2021-03-25", 
end_date: "2021-03-25",
start_time: "14:00:00",
end_time: "16:00:00", 
user_id: sa.id, 
category_id: education.id})

cw = Event.create({name: "Calligraphy Workshop", 
description: "Improve your handwriting with Ophelia Inkwell's Calligraphy Workshop! The class includes free practice worksheets and pen recommendations.",
location: "Tombow Studios", 
start_date: "2021-02-13", 
end_date: "2021-02-13",
start_time: "18:00:00",
end_time: "19:00:00", 
user_id: oi.id, 
category_id: crafting.id})

Rsvp.create({status: "Attending", number_of_attendee: 1, user_id: hh.id, event_id: ntt.id})
Rsvp.create({status: "Attending", number_of_attendee: 2, user_id: hh.id, event_id: cw.id})
Rsvp.create({status: "Interested", number_of_attendee: 1, user_id: hh.id, event_id: shg.id})
Rsvp.create({status: "Attending", number_of_attendee: 1, user_id: sa.id, event_id: nw.id})
Rsvp.create({status: "Attending", number_of_attendee: 1, user_id: sa.id, event_id: shg.id})
Rsvp.create({status: "Attending", number_of_attendee: 1, user_id: oi.id, event_id: spw.id})
Rsvp.create({status: "Attending", number_of_attendee: 1, user_id: oi.id, event_id: pfp.id})
