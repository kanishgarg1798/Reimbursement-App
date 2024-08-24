class CompaniesController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin, only: [:new, :create]

    # def index
    #     @companies = current_user.companies
    # end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new(company_params)
        @company.user = current_user
        if @company.save
            redirect_to root_path, notice: 'Company created successfully.'
        else
            puts @company.errors.full_messages
            render :new
        end
    end

    private
    
    def company_params
        params.require(:company).permit(:name, :employee_count, :reimbursement_sum)
    end

    def check_admin
        unless current_user.admin?
            redirect_to root_path, alert: 'You are not authorized'
        end
    end
end
