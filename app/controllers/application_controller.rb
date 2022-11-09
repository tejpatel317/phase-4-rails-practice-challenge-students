class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_not_valid

    private

    def record_not_valid( exception )
        render json: { errors: exception.record.errors.full_messages }, status: 422
    end

    def record_not_found( exception )
        render json: { error: "#{exception.model} not found" }, status: 404
    end
end
