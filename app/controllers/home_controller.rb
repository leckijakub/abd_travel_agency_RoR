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
    puts "\n\nDebug-msg: deleting old users\n\n"
    Client.destroy_all
    Employee.destroy_all
    User.destroy_all
    puts "\n\nDebug-msg: deleting old offers\n\n"
    Offer.destroy_all
    puts "\n\nDebug-msg: deleting old reservations\n\n"
    Reservation.destroy_all
  end

  def self.test_add_users
    puts "\n\nDebug-msg: adding new users\n\n"
    Client.create!(email: "a@a", password: "a", name: "Jan", surname: "Daczyński", uid: "u01", address: "tam", phone_number: "666 666 666")
    Employee.create!(email: "b@b", password: "a", name: "Edward", surname: "Gdaczek", uid: "u02", position: "admin")
  end

end
