class SessionsController < ApplicationController

    def create
        user = User.
                find_by(email: params["user"]["email"]).
                try(:authenticate, params["user"]["password"])
        if user
            session[:user_id] = user.id
            render json: {
                status: :created,
                logged_in: true,
                user: user
            }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: user.errors, status: :unprocessable_entity }
       end
    end

    def login
        @user = User.new
        puts @user
    end

end