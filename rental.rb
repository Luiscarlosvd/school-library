require './book'
require './person'

class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end
end

person1 = Person.new(22, 'maximilianus')
book1 = Book.new('lola', 'mento')
rental = Rental.new('10/02/23', book1, person1)
puts rental.inspect
