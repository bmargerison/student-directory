@students = []

def print_header
  puts "The students of Villains Academy".center(50)
end

def print_names
  puts "------------".center(50)
  return nil if @students.nil? 
  @students.each_with_index do |pupil, index| 
    print "#{index + 1}. #{pupil[:name]} (cohort: #{pupil[:cohort]}, "
    puts "hobby: #{pupil[:hobby]})"
  end
end

def print_names_cohort
  puts "------------".center(50)
  return nil if @students.nil? 
  current_cohorts = @students.map { |pupil| pupil[:cohort] }.uniq
  current_cohorts.each do |month|
    puts "Students in the #{month} cohort: "
    @students.each do |pupil|
      puts pupil[:name] if pupil[:cohort] == month
    end
  end
end

def print_footer
  puts "------------".center(50)
  puts "Overall we have #{@students.nil? ? 0 : @students.count} great students"
end

def input_students
  puts "Please enter the name of the first student"
  while true
    name = gets.strip
    break if name.empty?
    puts "What is their favourite hobby?"
    hobby = gets.strip
    puts "What cohort did they join?"
    month = gets.strip
    month.empty? ? month = november : month
    @students << {name: name, cohort: month, hobby: hobby}
    puts "Now we have #{@students.count} students" if @students.length > 1
    puts "Now we have 1 student" if @students.length == 1
    puts "------------".center(50)
    puts "Please enter the next name (or leave blank to exit)"
  end
  @students
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "------------".center(50)
  puts "1. Input the students."
  puts "2. Show the students."
  puts "3. Show the students grouped by cohort."
  puts "9. Exit."
end

def show_students(grouped=0)
  print_header
  grouped == 1 ? print_names_cohort : print_names
  print_footer
end

def process(selection)
  case selection
  when "1"
    puts "------------".center(50)
    input_students
  when "2"
    puts "------------".center(50)
    show_students(0)
  when "3"
    puts "------------".center(50)
    show_students(1)
  when "9"
    exit
  else
    puts "------------".center(50)
    puts "I don't know what you mean, try again."
  end
end

interactive_menu