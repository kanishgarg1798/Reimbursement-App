class ReimbursementClaim < ApplicationRecord
  belongs_to :employee
  belongs_to :company
  has_one_attached :file
end