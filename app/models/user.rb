class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 20, minimum: 2}
  
  attachment :profile_image, destroy: false
  has_many :postarticles
  #has_many :bookmarks, dependent: :destroy
  #has_many :postarticles, through: :bookmarks, source: :postaricle

  def own_board?(postarticle)
 	self.id == postarticle.user_id
  end
end
