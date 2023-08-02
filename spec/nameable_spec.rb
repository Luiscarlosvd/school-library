require_relative '../nameable'

describe Nameable do
  context 'When using Nameable class' do
    it 'has to raise an error when using correct_name method' do
      expect { subject.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
