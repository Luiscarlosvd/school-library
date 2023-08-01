require 'json'
require 'fileutils'
require './book'
require './student'
require './teacher'
require './rental'

module PreserveData
  def load_books
    books_arr = []
    if File.exist?('./storage_data/books.json')
      book_data = File.read('./storage_data/books.json')
      if book_data != ''
        JSON.parse(book_data).map do |book|
          books_arr << Book.new(book['title'], book['author'])
        end
      end
    end
    books_arr
  end

  def load_people
    people_arr = []
    if File.exist?('./storage_data/people.json')
      people_data = File.read('./storage_data/people.json')
      if people_data != ''
        JSON.parse(people_data).map do |person|
          if person['classname'] == 'Student'
            student = Student.new(person['classroom'], person['age'], person['parent_permission'], person['name'])
            student.id = person['id']
            people_arr << student
          else
            teacher = Teacher.new(person['specialization'], person['age'], person['name'])
            teacher.id = person['id']
            people_arr << teacher
          end
        end
      end
    end
    people_arr
  end

  def load_rentals
    rentals_arr = []
    if File.exist?('./storage_data/rentals.json')
      rentals_data = File.read('./storage_data/rentals.json')
      if rentals_data != ''
        JSON.parse(rentals_data).map do |rental|
          book = Book.new(rental['title'], rental['author'])
          if rental['classname'] == 'Student'
            student = Student.new(rental['classroom'], rental['age'], rental['parent_permission'],
                                  rental['name'])
            student.id = rental['id']
            rentals_arr << Rental.new(rental['date'], book, student)
          else
            teacher = Teacher.new(rental['specialization'], rental['age'], rental['name'])
            teacher.id = rental['id']
            rentals_arr << Rental.new(rental['date'], book, teacher)
          end
        end
      end
    end
    rentals_arr
  end

  def save_books
    json_book = []
    books.each do |book|
      json_book << { title: book.title, author: book.author }
    end

    FileUtils.touch('./storage_data/books.json')
    File.write('./storage_data/books.json', JSON.pretty_generate(json_book))
  end

  def save_people
    json_people = []
    people.each do |person|
      json_people << if person.instance_of?(::Student)
                       { id: person.id, age: person.age, classname: person.class.name, name: person.name,
                         parent_permission: person.parent_permission, classroom: person.classroom }

                     else
                       { id: person.id, age: person.age, classname: person.class.name, name: person.name,
                         specialization: person.specialization }
                     end
    end
    FileUtils.touch('./storage_data/people.json')
    File.write('./storage_data/people.json', JSON.pretty_generate(json_people))
  end

  def save_rental
    json_rental = []
    rentals.each do |rental|
      new_rental = {
        date: rental.date,
        title: rental.book.title,
        author: rental.book.author,
        id: rental.person.id,
        name: rental.person.name,
        age: rental.person.age,
        classname: rental.person.class.name
      }
      if rental.person.instance_of?(::Student)
        new_rental[:classroom] = rental.person.classroom
      else
        new_rental[:specialization] = rental.person.specialization
      end
      json_rental << new_rental
    end
    FileUtils.touch('./storage_data/rentals.json')
    File.write('./storage_data/rentals.json', JSON.pretty_generate(json_rental))
  end
end
