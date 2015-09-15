class User < ActiveRecord::Base

  has_secure_password

  has_many :properties, dependent: :destroy
  has_many :rooms, through: :properties
  has_many :devices, through: :properties

  has_many :api_keys

   validates :email, presence: true, uniqueness: true
   validates :username, presence: true, uniqueness: true
   validates :name, presence: true
  # validates :provider, presence: true
  # validates :uid, presence: true, uniqueness: { scope: :provider }
  # validates :username, presence: true
  validates :email, { :uniqueness => {:case_sensitive => false},
  :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i} }


  ### User Model - Class Methods
  ###########################################

  def keys
    [:name, :username, :email, ]
  end

  def counts
    user = User.find(session[:user_id])
    return {  homes: user.properties,
      rooms: user.rooms,
      devices: user.devices }
    end

    def session_api_key
      api_keys.active.session.first_or_create
   end

  end

