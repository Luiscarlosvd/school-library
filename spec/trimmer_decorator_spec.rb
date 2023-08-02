require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  context 'When using TrimmerDecorator method' do
    let(:nameable_mock) { double('nameable_mock', correct_name: 'Luis Carlos') }
    let(:decorator) { TrimmerDecorator.new(nameable_mock) }

    it 'cuts the name if the length of the name is bigger than 10' do
      expect(decorator.correct_name).to eq('Luis Carlo')
    end
  end
end
