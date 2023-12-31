require './book'
require './student'
require './teacher'
require './rental'
require './preserve_data'

class App
  include PreserveData
  attr_accessor :books, :people, :rentals

  def initialize
    @books = load_books
    @people = load_people
    @rentals = load_rentals
  end

  def list_all_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      puts
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No people found'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      puts
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_number = gets.chomp.to_i
    case person_number
    when 1
      create_student
      save_people
    when 2
      create_teacher
      save_people
    else
      puts 'Not valid number'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Classroom: '
    classroom = gets.chomp.capitalize
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase == 'Y'
    new_student = Student.new(classroom, age, parent_permission, name)
    @people << new_student
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    new_teacher = Teacher.new(specialization, age, name)
    @people << new_teacher
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    puts title, author
    newbook = Book.new(title, author)
    @books << newbook
    save_books
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    list_all_books
    number_book = gets.chomp.to_i
    book = @books[number_book]
    puts
    puts 'Select a person from the following list by number: '
    list_all_people
    number_person = gets.chomp.to_i
    person = @people[number_person]
    puts
    print 'Date: '
    date = gets.chomp.to_s
    new_rental = Rental.new(date, book, person)
    @rentals << new_rental
    save_rental
    print 'Rental created successfully'
  end

  def list_rentals_by_id
    print 'ID of person: '
    id_person = gets.chomp.to_i
    person_to_find = @rentals.select { |rental| rental.person.id == id_person }
    puts 'Rentals: '
    person_to_find.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
    puts
  end
end
