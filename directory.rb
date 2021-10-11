def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_names(names)
  count = 0
  while count < names.length
    puts "#{count+1}. #{names[count][:name]} (#{names[count][:cohort]})"
    count += 1
  end
end

def print_footer(names)
  print "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student to hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

students = input_students
print_header
print_names(students)
print_footer(students)