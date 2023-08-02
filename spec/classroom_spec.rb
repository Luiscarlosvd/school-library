require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'When using the classroom class' do
    it 'Has to create an instance of the classroom' do
      classroom = Classroom.new('Mathematics')

      expect(classroom).to be_instance_of Classroom
      expect(classroom.label).to eq('Mathematics')
    end

    it 'has to add a student to the classroom when using add_student method' do
      classroom = Classroom.new('Mathematics')
      student = Student.new(classroom, 17, true, 'Luis Valera')

      classroom.add_student(student)

      expect(classroom.students).to include(student)
    end
  end
end
