class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :reimbursement_claims, dependent: :destroy

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: {scope: :company_id, message: "is already assigned to this company" }
  validates :name, presence: true

  validate :employee_count_within_limit
  validate :ensure_unique_email_across_companies

  private

  def employee_count_within_limit
    if company && company.employees.count >= company.employee_count
      errors.add(:company, "Can't have more employees than the employee count limit")
    end
  end

  def ensure_unique_email_across_companies
    if Employee.where(email: email).where.not(company_id: company_id).exists?
      errors.add(:email, "is already assigned to another company")
    end
  end
end