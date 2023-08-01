require 'json'
require 'fileutils'

module PreserveData
    def load_books
        books_arr = []
        if File.exist?("./storage_data/books.json")
            
        else
            books_arr
        end
    end

    def save_books
        json_book = []
        books.each { |book|
            json_book << {title: book.title, author: book.author}
        }
        return json_book.isEmpty?

        FileUtils.touch("./storage_data/books.json")
        File.write("./storage_data/books.json", JSON.pretty_generate(json_book))
    end
end