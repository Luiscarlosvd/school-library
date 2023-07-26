require './book'
require './student'
require './teacher'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
        puts 'No people found'
    else
        @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def create_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    person_number = gets.chomp.to_i
    case person_number
    when 1
        create_student
    when 2
        create_teacher
    else
        puts "Not valid number"
    end
  end

  def create_student
    print "Age: "
    age = gets.chomp.to_i
    print "Name: "
    name = gets.chomp
    print "Classroom: "
    classroom = gets.chomp.capitalize
    print "Has parent permission? [Y/N]: "
    parent_permission = gets.chomp.upcase
    if parent_permission === "Y"
        parent_permission = true
    elsif parent_permission === "N"
        parent_permission = false
    else
        return puts "Not valid permission answer"
    end
    newStudent = Student.new(classroom, age, name, parent_permission)
    @people << newStudent
    puts "Person created successfully"
  end

  def create_teacher
    puts "creating a teacher"
  end

  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    puts title, author
    newbook = Book.new(title, author)
    @books << newbook
    puts 'Book created successfully'
  end
end

newapp = App.new
puts newapp.create_person
