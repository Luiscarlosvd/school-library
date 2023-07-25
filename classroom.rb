require './student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end

classroom = Classroom.new('maths')
student = Student.new('maths', 18, 'bob')
student1 = Student.new('maths', 19, 'luis')

classroom.add_student(student1)
classroom.add_student(student)
puts classroom.students.inspect
