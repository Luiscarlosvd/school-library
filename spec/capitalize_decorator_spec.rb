require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  context "When using capitalizeDecorator method" do
    let(:nameable_mock) { double('nameable_mock', correct_name: 'john') }
    let(:decorator) { CapitalizeDecorator.new(nameable_mock) }

    it 'capitalizes the first letter of the correct name' do
      expect(decorator.correct_name).to eq('John')
    end
  end
end