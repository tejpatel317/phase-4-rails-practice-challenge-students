class InstructorsController < ApplicationController

    def index
        render json: Instructor.all
    end

    def show
        render json: Instructor.find( params[:id] ), status: 302
    end

    def create
        render json: Instructor.create!( instructor_params )
    end

    def update
        instructor = Instructor.find( params[:id] )
        instructor.update!( instructor_params )
        render json: instructor, status: :ok
    end

    def destroy
        instructor = Instructor.find( params[:id] )
        instructor.destroy
        head :no_content
    end

    private

    def instructor_params
        params.permit( :name )
    end

end
