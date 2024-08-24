class ReimbursementClaimsController < ApplicationController
    before_action :authenticate_user!

    def new
        @reimburse_claim = ReimbursementClaim.new
    end

    def create
        @reimburse_claim = ReimbursementClaim.new(reimburse_params)

        if current_user.admin?
            @assigned_employee = Employee.find_by(id: params[:reimbursement_claim][:employee_id])
        else
            @assigned_employee = Employee.find_by(email: current_user.email)
        end
        
        if @assigned_employee
            @reimburse_claim.company_id = @assigned_employee.company_id
            @reimburse_claim.employee_id = @assigned_employee.id
            if @reimburse_claim.save
                redirect_to root_path, notice: 'Reimbursement added successfully.'
            else
                render :new
            end
        else
            redirect_to root_path, alert: 'You are not associated with any company.'
        end
    end

    private

    def reimburse_params
        params.require(:reimbursement_claim).permit(:purpose, :amount, :date_of_expenditure, :employee_id, :file)
    end
end
