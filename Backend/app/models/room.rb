class Room < ActiveRecord::Base

  belongs_to :property
  belongs_to :user
  has_many :devices

  def keys
    [:name, :description]
  end

end
