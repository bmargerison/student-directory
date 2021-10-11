def print_header
  puts "The students of Villains Academy".center(50)
end

def print_names(names)
  puts "------------".center(50)
  names.each_with_index do |student, index| 
    print "#{index + 1}. #{student[:name]} (cohort: #{student[:cohort]}, "
    puts "hobby: #{student[:hobby]})"
  end
end

def print_names_cohort(students)
  puts "------------".center(50)
  current_cohorts = students.map { |student| student[:cohort] }.uniq
  current_cohorts.each do |month|
    puts "Students in the #{month} cohort: "
    students.each do |student|
      puts student[:name] if student[:cohort] == month
    end
  end
end

def print_footer(names)
  puts "------------".center(50)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  students = []
  puts "Please enter the name of the first student"
  while true
    name = gets.strip
    break if name.empty?
    puts "What is their favourite hobby?"
    hobby = gets.strip
    puts "What cohort did they join?"
    month = gets.strip
    month.empty? ? month = november : month
    students << {name: name, cohort: month, hobby: hobby}
    puts "Now we have #{students.count} students" if students.length > 1
    puts "Now we have 1 student" if students.length == 1
    puts "------------".center(50)
    puts "Please enter the next name (or leave blank to exit)"
  end
  students.empty? ? nil : students 
end

students = input_students
print_header
print_names(students)
print_footer(students)
print_names_cohort(students)