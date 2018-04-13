Rails.application.routes.draw do
  #get 'welcome/index'

 root 'welcome#index'
 
 #generate user routes
 resources :users
 resources :degrees
 resources :employers
 resources :universities
 resources :roles
 resources :departments
 resources :colleges
 resources :students do
end


# For testing college/department/degree partials
#begin
 get 'find_degree' => 'degrees#find_degree'
 
 
 
# For links on student details page

get 'students/:id/add_degree' => 'students_details#add_earned_degree', as: :student_add_earned_degree
get 'students/:id/submit_add_degree' => 'students_details#submit_add_earned_degree', as: :submit_student_add_earned_degree
get 'students/students/:id/grad_school' => 'students#grad_school'
get 'students/students/:id/employment' => 'students#employment'
# end group for student details page
 
 
 get 'auth/:provider/callback' => 'sessions#create'
 get 'logout' => 'sessions#destroy'
 get 'auth/failure' => 'sessions#failure'
 get 'auth/google_oauth2', :as => 'login'
 
 get 'students/:id/add_grad_school' => 'students_details#add_grad_school', as: :add_grad_school
 get 'students/:id/submit_add_grad_school' => 'students_details#submit_add_grad_school', as: :submit_add_grad_school
 
 get 'students/:id/add_employment' => 'students_details#add_employment', as: :add_employment
 get 'students/:id/submit_add_employment' => 'students_details#submit_add_employment', as: :submit_add_employment
 delete  'students/:id/delete_employment' => 'students_details#delete_employment', as: :delete_employment
 get 'students/:id/edit_employment' => 'students_details#edit_employment', as: :edit_employment
 get 'students/:id/update_employment' => 'students_details#update_employment', as: :update_employment
end
#end