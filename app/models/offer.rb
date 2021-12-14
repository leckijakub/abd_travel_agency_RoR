class Offer < ApplicationRecord
    has_many :reservation, dependent: :destroy
end
