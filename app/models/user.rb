class User < ApplicationRecord
  before_create :set_username
  has_many :books
  has_many :comments
  has_many :trades
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

 def login
     @login || self.email || self.username
   end

 attr_writer :login
  

private

  def set_username
    self.username = self.email.split("@").first()
    validates_length_of :username,
    :within => 5..50,
    :presence => true
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
  
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
   
end
