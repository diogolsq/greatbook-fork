class GradesController < ApplicationController
  def create
    unless can_create_grades?(student: student)
      raise NotAllowed, "Not allowed to set grades for #{student.name} in section #{section.id}"
    end

    grade = section.set_grade(student: student, grade: params[:grade])

    render json: { grade: grade }, status: :created
  end

  def update
    unless can_update_grades?
      raise NotAllowed, "Not allowed to revise grades for #{student.name} in section #{section.id}"
    end

    grade = section.set_grade(student: student, grade: params[:grade])

    render json: { grade: grade }
  end

  private

  def section
    @section ||= Section.find(params[:section_id])
  end

  def student
    @student = section.students.find(params[:student_id])
  end

  def can_update_grades?
    Section::Role.for(section, current_user).can_update?
  end

  def can_create_grades?(student)
    Section::Role.for(section, current_user).can_create?(student)
  end
end
