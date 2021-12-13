class HomeController < ApplicationController
  def index
    puts "home login"
  end
  
  def login
    puts "home login"
    
  end

  def test
    puts "\n\nDebug-msg: Testing the database... watch out...\n\n"
    HomeController.test_dell_all
    HomeController.test_add_users
    flash[:notice] = "Test has finished successfully"
    redirect_to :controller => "home"
  end

  def self.test_dell_all
    puts "\n\nDebug-msg: deleting old offers\n\n"
    @offers = Offer.all
    @offers.each do |offer|
      offer.destroy
    end
    
    puts "\n\nDebug-msg: deleting old users\n\n"
    @users = User.all
    @users.each do |user|
      user.destroy
    end
  end

  def self.test_add_users
    puts "\n\nDebug-msg: adding new users\n\n"
    # User.create!(email: "a@a", password: "1234563", name: "Jan", surname: "Daczyński", uid: "u01")
    Client.create!(email: "a@a", password: "a", name: "Jan", surname: "Daczyński", uid: "u01", address: "tam", phone_number: "666 666 666")
    Employee.create!(email: "b@b", password: "a", name: "Edward", surname: "Gdaczek", uid: "u02", position: "admin")
    # Client.create!(address: "tam", phone_number:"666 666 666")
  end

end
