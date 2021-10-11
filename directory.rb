#let's put all the students into an array
students = [
  ["Dr. Hannibal Lecter", :november],
  ["Darth Vader", :november],
  ["Nuse Ratched", :november],
  ["Michael Corleone", :november],
  ["Alex DeLarge", :november],
  ["The Wicked Witch of the West", :november],
  ["Terminator", :november],
  ["Freddy Krueger", :november],
  ["The Joker", :november],
  ["Joffrey Baratheon", :november],
  ["Norman Bates", :november]
]

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_names(names)
  names.each { |student| puts "#{student[0]} (#{student[1]} cohort)" }
end

def print_footer(names)
  print "Overall, we have #{names.count} great students"
end

print_header
print_names(students)
print_footer(students)