require_relative '../student'
require_relative '../classroom'

describe Student do
  context 'When testing the student class' do
    it 'has to create an instance of Student' do
      student = Student.new('Maths', 17, true, 'Luis Valera')

      expect(student).to be_instance_of Student
      expect(student.age).to eq(17)
      expect(student.name).to eq('Luis Valera')
    end

    it 'has to return the correct string when using play_hooky method' do
      student = Student.new('Maths', 17, true, 'Luis Valera')

      result = student.play_hooky

      expect(result).to eq(' ¯\\(ツ)/¯ ')
    end
  end
  context 'When testing the classroom method' do
    let(:classroom) { Classroom.new('Mathematics') }
    let(:student) { Student.new('Math', 15, true, 'Luis') }

    it 'adds the student to the new classroom when the classroom is diferent using classroom method' do
      student.classroom = classroom

      expect(student.classroom).to eq(classroom)
    end
  end
end
