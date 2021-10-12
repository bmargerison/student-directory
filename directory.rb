def print_header
  puts "The students of Villains Academy".center(50)
end

def print_names(names)
  puts "------------".center(50)
  return nil if names.nil? 
  names.each_with_index do |student, index| 
    print "#{index + 1}. #{student[:name]} (cohort: #{student[:cohort]}, "
    puts "hobby: #{student[:hobby]})"
  end
end

def print_names_cohort(students)
  puts "------------".center(50)
  return nil if students.nil? 
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
  puts "Overall, we have #{names.nil? ? 0 : names.count} great students"
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
  students
end

def interactive_menu
  students_selected =[]
  loop do
    puts "------------".center(50)
    puts "1. Input the students."
    puts "2. Show the students."
    puts "3. Show the students grouped by cohort."
    puts "9. Exit."
    selection = gets.chomp
    case selection
    when "1"
      puts "------------".center(50)
      students_selected = input_students
    when "2"
      puts "------------".center(50)
      print_header
      print_names(students_selected)
      print_footer(students_selected)
    when "3"
      puts "------------".center(50)
      print_header
      print_names_cohort(students_selected)
      print_footer(students_selected)
    when "9"
      exit
    else
      puts "------------".center(50)
      puts "I don't know what you mean, try again."
    end
  end
end

interactive_menu