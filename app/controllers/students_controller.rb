class StudentsController < ApplicationController

    def index
        render json: Student.all
    end

    def show
        render json: Student.find( params[:id] ), status: 302
    end

    def create
        render json: Student.create!( student_params )
    end

    def update
        student = Student.find( params[:id] )
        student.update!( Student_params )
        render json: student, status: :ok
    end

    def destroy
        student = Student.find( params[:id] )
        student.destroy
        head :no_content
    end

    private

    def student_params
        params.permit( :name, :major, :age, :instructor_id )
    end

end
