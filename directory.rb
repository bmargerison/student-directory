def print_header
  puts "The students of Villains Academy".center(50)
  puts "------------".center(50)
end

def print_names(names)
  names.each_with_index do |student, index| 
    print "#{index + 1}. #{student[:name]} (cohort: #{student[:cohort]}, "
    puts "hobby: #{student[:hobby]})"
  end
end

def print_footer(names)
  print "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the name of the first student"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "What is their favourite hobby?"
    hobby = gets.chomp
    puts "What cohort did they join?"
    month = gets.chomp
    month.empty? ? month = :november : month.to_s
    students << {name: name, cohort: month, hobby: hobby}
    puts "Now we have #{students.count} students"
    puts "Please enter the next name (or leave blank to exit)"
    name = gets.chomp
  end
  students
end

students = input_students
print_header
print_names(students)
print_footer(students)