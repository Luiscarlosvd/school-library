require './app'
require './choice_selected'

class Main
  def initialize
    @app = App.new
  end

  def start
    puts 'Welcome to School Libary App!'

    loop do
      number_choice = list_of_options
      if number_choice == 7
        puts 'Thanks for using the school library App!'
        exit
      else
        new_choice = ChoiceSelected.new(@app)
        new_choice.choice_selected(number_choice)
      end
    end
  end

  def list_of_options
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rental for a given person id'
    puts '7 - Exit'
    puts
    gets.chomp.to_i
  end
end

def main
  main = Main.new
  main.start
end

main
