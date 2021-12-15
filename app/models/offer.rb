class Offer < ApplicationRecord
    has_many :reservation, dependent: :destroy
    belongs_to :employee
end
