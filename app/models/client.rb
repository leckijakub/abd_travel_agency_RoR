class Client < ApplicationRecord

    has_one :user, :as => :role, dependent: :destroy
    accepts_nested_attributes_for :user

    # quoted_table_name "clients"
    # attr_accessor :address, :phone_number
    # attr_accessor :my_email, :my_password, :my_name, :my_surname, :my_uid
    # attr_accessor :user_attributes

    # private
    # def client_params
    #   params.require(:client).permit(:address, :phone_number)
    # end
    
    # def initialize(email:, password:, name:, surname:, uid:, address:, phone_number:)
    #     puts "\n\nDebug-msg: Creating Client!!!!!!!!!!!!!!\n\n"
    #     @address = address
    #     @phone_number = phone_number
    #     puts "\n\nDebug-msg: Client Created!!!!!!!!!!!!!!\n\n"
    #     # @my_email = email
    #     # @my_password = password
    #     # @my_name = name
    #     # @my_surname = surname
    #     # @my_uid = uid
    #     #  @user = User.new(email: email, password: password, name: name, surname: surname, uid: uid)
    #     # self.build_user
    #     # self.user.crete
    #     # self.user = @user
    #     # @user.save
    #     # self.create_user(email: email, password: password, name: name, surname: surname, uid: uid)
    # end

    after_create :do_create_user

    def do_create_user
        puts "\n\nDebug-msg: Creating User!!!!!!!!!!!!!!\n\n"
        self.create_user(email: "a@a", password: "1234563", name: "Jan", surname: "Daczyński", uid: "u01")
        # self.create_user(email: self.my_email, password: self.my_password, name: self.my_name, surname: self.my_surname, uid: self.my_uid)
    end

  end
  