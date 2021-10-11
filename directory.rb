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

def print_names_cohort(students)
  current_cohorts = students.map { |student| student[:cohort] }.uniq
  current_cohorts.each do |month|
    puts "Students in the #{month} cohort: "
    students.each do |student|
      puts student[:name] if student[:cohort] == month
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
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
    month.empty? ? month = november : month
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
print_names_cohort(students)