
class StudentsDetailsController < ApplicationController
   
   
def earned_degree_params
    params.require(:earned_degree).permit(
    :season,
    :year_graduated,
    :degree_id)
end
def employment_params
  params.require(:employment).permit(
    :job_title,
    :start_date,
    :end_date,
    :employer_id,
    :current_job,
    :in_field)
end

def grad_schools_params
  params.require(:grad_schools).permit(
    :applied,
    :accepted,
    :status,
    :higher_degree_type,
    :higher_degree_name,
    :university_id)
end
   
#earned degrees
  def add_earned_degree
    @id = params[:id]
    @student = Student.find(@id)
    @earned_degree = EarnedDegree.new
  end
     
  def submit_add_earned_degree
    @id = params[:id] 
    EarnedDegree.create!(earned_degree_params.merge({student_id: @id}))
    redirect_to student_path(@id)
  end
  def delete_earned_degree
    @id = params[:id] 
    @earned_degree= EarnedDegree.find(@id) 
    @student = Student.find(@earned_degree.student_id)
    if @student.earned_degrees.count > 1
      @earned_degree.destroy
    else
      flash[:notice] = "Can't delete the last degree"
    end
    redirect_to student_path(@student)
  end

#grad school
  def add_grad_school
    @universities = University.all
    @id = params[:id]
    @name = Student.find(@id).first_name + " " + Student.find(@id).last_name
  end
      
  def submit_add_grad_school
    @id = params[:id]
    @grad_schools = GradSchool.create!(grad_schools_params.merge({student_id: @id}))
    redirect_to student_path(@id)
  end
  def delete_grad_school
    @id = params[:id] 
    @grad_school= GradSchool.find(@id) 
    @student_id = @grad_school.student_id
    @grad_school.destroy
    redirect_to student_path(@student_id)
  end
  def edit_grad_school
    @id = params[:id] 
    @grad_school = GradSchool.find(@id) 
    @name = @grad_school.student_name
    @student_id = Student.find(@grad_school.student_id).id
  end
  def update_grad_school
    id = params[:id] 
    @grad_school = GradSchool.find(id)
    @grad_school.update_attributes!(grad_schools_params)
    @student_id = @grad_school.student_id
    redirect_to student_path(@student_id)
  end
#employment
  
  def add_employment
    @employers = Employer.all
    @id = params[:id]
    @name = Student.find(@id).first_name + " " + Student.find(@id).last_name
  end

  def submit_add_employment
    @id = params[:id]
    @student = Student.find(@id) 
    @employment = Employment.create!(employment_params.merge({student_id: @id}))
    redirect_to student_path(@student)
  end
  
  def delete_employment
    @id = params[:id] 
    @employment= Employment.find(@id) 
    @student_id = @employment.student_id
    @employment.destroy
    redirect_to student_path(@student_id)
  end
  def edit_employment
    @id = params[:id] 
    @employment = Employment.find(@id) 
    @student_id = Student.find(@employment.student_id).id
  end
  def update_employment
    id = params[:id] 
    @employment = Employment.find(id)
    @employment.update_attributes!(employment_params)
    @student_id = @employment.student_id
    redirect_to student_path(@student_id)
  end
    
end
