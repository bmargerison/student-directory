#let's put all the students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nuse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
#and then print them
puts "The students of Villains Academy"
puts "------------"
students.each { |name| puts name }
#finally, we print the total number of students
print "Overall, we have #{students.count} great students"