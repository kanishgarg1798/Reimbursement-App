class EmployeesController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin, only: [:new, :create]

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        @employee.user = current_user
        if @employee.save
            redirect_to root_path, notice: 'Employee added successfully.'
        else
            render :new, alert: @employee.errors.full_messages.to_sentence
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:name, :company_id, :email)
    end

    def check_admin
        unless current_user.admin?
            redirect_to root_path, alert: 'You are not authorized to perform this action.'
        end
    end
end
