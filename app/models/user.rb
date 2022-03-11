# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  extend Devise::Models
  include DeviseTokenAuth::Concerns::User

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :vehicals
  after_create :assign_role
       
  def assign_role
    add_role :user
  end

end
