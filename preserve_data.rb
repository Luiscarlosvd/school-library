require 'json'
require 'fileutils'
require './book'
require './student'
require './teacher'

module PreserveData
  def load_books
    books_arr = []
    if File.exist?('./storage_data/books.json')
      book_data = File.read('./storage_data/books.json')
      if book_data != ''
        JSON.parse(book_data).map do |book|
          books_arr.push(Book.new(book['title'], book['author']))
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
            people_arr << (Student.new(person['classroom'], person['age'], person['parent_permission'], person['name']))
          else 
            people_arr << (Teacher.new(person['specialization'], person['age'], person['name']))
          end
        end
      end
    end
    people_arr
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
      if person.class.name == 'Student'
        json_people << {age: person.age, classname: person.class.name, name: person.name, parent_permission: person.parent_permission, classroom: person.classroom}

      else
        json_people << {age: person.age, classname: person.class.name, name: person.name, specialization: person.specialization}
      end

    end
    FileUtils.touch('./storage_data/people.json')
    File.write('./storage_data/people.json', JSON.pretty_generate(json_people))
  end

  def save_rental
    json_rental = []
    rentals.each do |rental|
      newRental = {
        date: rental.date,
        title: rental.book.title,
        author: rental.book.author,
        id: rental.person.id,
        name: rental.person.name,
        age: rental.person.age,
        classname: rental.person.class.name
      }
      if rental.person.class.name == 'Student'
        newRental[:classroom] = rental.person.classroom
      else
        newRental[:specialization] = rental.person.specialization
      end
      json_rental << newRental
    end
    FileUtils.touch('./storage_data/rentals.json')
    File.write('./storage_data/rentals.json', JSON.pretty_generate(json_rental))
  end
end
