class WikiPolicy < ApplicationPolicy
  
  def update?
    user.present?
  end
  
  def show?
    user.present? && user == record.user
  end
  
end
