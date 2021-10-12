require 'csv'
require 'time'

@students = []

def spacer
  puts "------------".center(50)
end

def print_header
  puts "The students of Villains Academy".center(50)
  spacer
end

def print_names_cohort
  return nil if @students.nil? 
  current_cohorts = @students.map { |pupil| pupil[:cohort] }.uniq
  current_cohorts.each do |month|
    puts "Students in the #{month} cohort: "
    @students.each do |pupil|
      puts pupil[:name] if pupil[:cohort] == month
    end
  end
  spacer
  student_count
end

def print_names
  return nil if @students.nil? 
  @students.each_with_index do |pupil, index| 
    print "#{index + 1}. #{pupil[:name]} (cohort: #{pupil[:cohort]}, "
    puts "hobby: #{pupil[:hobby]})"
  end
  spacer
end

def show_students(grouped=0)
  print_header
  grouped == 1 ? print_names_cohort : print_names
  student_count
end

def add_student(name, hobby, cohort)
  @students << {name: name, hobby: hobby, cohort: cohort}
end

def student_count
  puts "We have #{@students.count} students" if @students.length > 1
  puts "We have 1 student" if @students.length == 1
  spacer
end

def input_students
  puts "Please enter the name of the first student"
  while true
    name = gets.strip
    break if name.empty?
    puts "What is their favourite hobby?"
    hobby = gets.strip
    puts "What cohort did they join?"
    month = gets.chop.downcase
    month.empty? ? month = Time.new.strftime("%B").downcase : month
    add_student(name, hobby, month)
    student_count
    puts "Please enter the next name (or leave blank to exit)"
  end
  @students
end

def save_students
  CSV.open("students.csv", "wb") do |csv|
    @students.each do |pupil|
      csv << [pupil[:name], pupil[:hobby], pupil[:cohort]]
    end
  end
  puts "Students successfully saved."
  spacer
end

def load_students
  CSV.foreach("students.csv") do |row|
    name, hobby, cohort = row
    add_student(name, hobby, cohort)
  end
  puts "Students successfully loaded."
  student_count
  spacer
end

def process(selection)
  case selection
  when "1" then input_students
  when "2" then show_students
  when "3" then show_students(1)
  when "4" then save_students
  when "5" then load_students
  when "9" then exit
  else puts "I don't know what you mean, try again."
  end
end

def print_menu
  puts "1. Input the students."
  puts "2. Show the students."
  puts "3. Show the students grouped by cohort."
  puts "4. Save the list to students.csv."
  puts "5. Load the list from students.csv."
  puts "9. Exit."
  spacer
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu