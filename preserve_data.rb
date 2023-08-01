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

  def save_books
    json_book = []
    books.each do |book|
      puts book
      json_book << { title: book.title, author: book.author }
    end

    FileUtils.touch('./storage_data/books.json')
    File.write('./storage_data/books.json', JSON.pretty_generate(json_book))
  end
end
