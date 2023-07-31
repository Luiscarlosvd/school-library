class ChoiceSelected
  def initialize(app)
    @app = app
  end

  def choice_selected(number)
    case number
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals_by_id
    else
      puts 'Invalid number: Please enter a valid number next time'
    end
  end
end
