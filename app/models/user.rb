class User < ApplicationRecord
  has_many :trainings, dependent: :destroy
  attr_accessor :login
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  validates :username, presence: true, 
            uniqueness: { case_sensitive: false },
            length: { minimum: 3 }, 
            format: { with: /\A[a-zA-Z0-9_]+\z/, message: "only allows letters, numbers and '_'" }

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end
end
