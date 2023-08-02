require_relative '../base_decorator'

describe Decorator do
  describe 'When using the base_decorator class method' do
    let(:nameable_mock) { double('nameable_mock', correct_name: 'John Doe') }
    let(:decorator) { Decorator.new(nameable_mock) }

    it 'returns the correct name' do
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
