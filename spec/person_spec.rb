require_relative '../person'
require_relative '../rental'

describe Person do
  context "When testing the person class" do
    it "Has to return true when using can_use_services? method age >=18 and parent_permission = true" do
      person = Person.new(18, "Luis", parent_permission: true )

      result = person.can_use_services?

      expect(result).to be true
    end

    it "Has to return false when using can_use_services? method age < 18 and parent_permission = false" do
      person = Person.new(17, "Luis", parent_permission: false )

      result = person.can_use_services?

      expect(result).to be false
    end

    it "Has to create a rental when using add_rental method" do
      person = Person.new(18, "Luis", parent_permission: true )
      book = double("book")
      allow(book).to receive(:title) {"Luis Carlos"}
      allow(book).to receive(:author) {"Adeyemi"}
      allow(book).to receive(:rentals) {[]}

      result = person.add_rental(book, "00/00/00")

      expect(result).to be_instance_of Rental
    end

    it "Has to return the name after person" do
      person = Person.new(18, "Luis", parent_permission: true )
      result = person.correct_name
      expect(result).to eq("Luis")
    end

    it "Has to return false when the person is not of age" do
      person = Person.new(17, "Luis", parent_permission: false )
      expect(person.send(:of_age?)).to be false
    end
  end
end