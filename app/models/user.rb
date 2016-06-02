class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :wikis, dependent: :destroy
  has_many :collaborators
  has_many :wikis, through: :collaborators
  
  def wikis
    the_wikis = []
    the_wikis << Collaborator.where(user: self).map(&:wiki)
    the_wikis << Wiki.where(user: self)
    the_wikis.flatten
  end
  
  def standard?
    role == "standard"
  end
  
  def admin?
    role == "admin"
  end
  
  def premium?
    role == "premium"
  end
end
