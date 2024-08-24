class Company < ApplicationRecord
    belongs_to :user
    has_many :employees
    # has_many :reimbursement_claims, through: :employees

    validates :name, presence: true
    validates :employee_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :reimbursement_sum, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    # validates :user, presence: true
end