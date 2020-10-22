module UserHelper
  def to_follow
    ids = current_user.followed_users.pluck(:id) << current_user.id
    User.where.not(id: ids).take(15)
  end
end
