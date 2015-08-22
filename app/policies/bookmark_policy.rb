class BookmarkPolicy < ApplicationPolicy
  
  def update?
    user.present? && (record.creator == user)
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && (record.creator == user)
  end
  
end