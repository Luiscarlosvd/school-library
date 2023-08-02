require_relative '../teacher'

describe Teacher do
  context "When using teacher class method" do
    it 'Has to return true when using can_use_services?' do
      teacher = Teacher.new('Mathematics',30, 'Luis')

      result = teacher.can_use_services?
      expect(result).to be true
    end

    it 'has to create an instance of teacher' do
      teacher = Teacher.new('Maths', 50, 'Luis Valera')

      expect(teacher).to be_instance_of Teacher
      expect(teacher.age).to eq(50)
      expect(teacher.name).to eq('Luis Valera')
    end
  end
end