class HomeController < ApplicationController
  def index
  end
  
  def login
    
  end

  def test
    @var = Offer.all
    puts "\n\nDebug-msg: Testing the database... watch out...\n\n"
  end

end
