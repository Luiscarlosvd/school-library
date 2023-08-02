require_relative '../book.rb'
require_relative '../rental.rb'

describe Book do
    context 'When testing the book class' do
        it "Has to create an instance of book class" do
            book = Book.new("Luis", "Adeyemi")

            expect(book).to be_instance_of Book
        end

        it "Has to create a rental when using add_rental method" do
            book = Book.new("Luis", "Adeyemi")
            person = double("person")
            allow(person).to receive(:name) {"Luis Carlos"}
            allow(person).to receive(:rentals) {[]}

            result = book.add_rental(person, "00/00/00")

            expect(result).to be_instance_of Rental
        end
    end
end