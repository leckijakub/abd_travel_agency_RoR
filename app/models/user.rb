class User < ApplicationRecord

  private
  def user_params
    params.require(:user).permit(:name, :title, :username, :password)
  end

  belongs_to :role, dependent: :destroy, :polymorphic => true

  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
