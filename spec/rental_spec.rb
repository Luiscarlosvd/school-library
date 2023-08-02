require_relative '../rental'

describe Rental do
  context 'When testing rental class method' do
    it 'Has to create a rental' do
      book = double('book')
      allow(book).to receive(:title) { 'Luis Carlos' }
      allow(book).to receive(:author) { 'Adeyemi' }
      allow(book).to receive(:rentals) { [] }
      student = double('student')
      allow(student).to receive(:name) { 'Luis Carlos' }
      allow(student).to receive(:age) { 18 }
      allow(student).to receive(:rentals) { [] }
      rental = Rental.new('date', book, student)

      expect(rental).to be_instance_of Rental
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(student)
      expect(rental.date).to eq('date')
    end
  end
end
