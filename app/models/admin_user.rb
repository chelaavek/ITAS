class AdminUser < ApplicationRecord
  acts_as_google_authenticated :lookup_token => :mfa_secret,
                               :encrypt_secrets => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  delegate :can?, :cannot?, :to => :ability
  has_one :review
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :trackable, :registerable,
         :confirmable

  ADMIN='admin'
  USER='user'
  BANNED='banned'
  ROLES ={ADMIN=>'admin',USER =>'user', BANNED=>'banned' }

  def ability
    @ability ||= Ability.new(self)
  end
end
