class Wiki < ActiveRecord::Base
  belongs_to :user
  
  scope :visible_to, -> user { user ? all : where(private: false) }
  
  has_many :collaborators
  has_many :users, through: :collaborators
  
  def public?
    private == false
  end
end
