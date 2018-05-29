module Api
  class CompaniesController < ActionController::API
    before_action :auth

    def users
      render json: company.users
    end

    def offices
      render json: company.offices
    end

    private
    def company
      @company ||= Company.find(params[:company_id])
    end

    def auth
      unless params[:token] == ENV["API_AUTH_TOKEN"]
        render json: { message: "Invalid Token" }, status: :unauthorized
      end
    end
  end
end
