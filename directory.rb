def print_header
  puts "The students of Villains Academy".center(50)
  puts "------------".center(50)
end

def print_names(names)
  count = 0
  while count < names.length
    print "#{count+1}. #{names[count][:name]} (cohort: #{names[count][:cohort]}"
    puts ", hobby: #{names[count][:hobby]})"
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
    #let's add a hobby for each person
    puts "What is their favourite hobby?"
    hobby = gets.chomp
    #add the student to hash to the array
    students << {name: name, cohort: :november, hobby: hobby}
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