require 'json'
require 'fileutils'
require './book'

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
    end
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
        json_people << {age: person.age, classname: person.class.name, name: person.name, parent_permission: person.parent_permission, specialization: person.specialization}
      end

    end
    FileUtils.touch('./storage_data/people.json')
    File.write('./storage_data/people.json', JSON.pretty_generate(json_people))
  end
end
