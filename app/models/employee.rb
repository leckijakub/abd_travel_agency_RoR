class Employee < ApplicationRecord
#   set_table_name "employees"
  attr_accessible :position
  attr_accessible :user_attributes

  has_one :user, :as => :role, dependent: :destroy
    accepts_nested_attributes_for :user
end
