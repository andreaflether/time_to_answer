class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile
  accepts_nested_attributes_for :user_profile, allow_destroy: true
  validates :first_name, presence: true, length: {minimum: 3}, on: :update

  def full_name 
    [self.first_name, self.last_name].join(' ')
  end 
end
