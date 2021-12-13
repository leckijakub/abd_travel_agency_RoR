class Client < ApplicationRecord

    has_one :user, :as => :role, dependent: :destroy
    accepts_nested_attributes_for :user

    # attr_accessor :address, :phone_number
    attr_accessor :email, :password, :name, :surname, :uid

    after_create :do_create_user

    def do_create_user
        puts "\n\nDebug-msg: Creating User!\n\n"
        puts self.email
        puts User.find_by_email(self.email).inspect
        self.create_user!(email: self.email, password: self.password, name: self.name, surname: self.surname, uid: self.uid)
    end
end
  