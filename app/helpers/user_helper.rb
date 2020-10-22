module UserHelper
  def to_follow
    ids = current_user.followed_users.pluck(:id) << current_user.id
    User.where.not(id: ids).take(15)
  end

  def follow_btns(user)
    if user != current_user
      if !current_user.followed_users.include?(user)
        link_to('Follow', followings_path(id: user.id), class: 'btn btn-primary btn-sm', method: :post)
      else
        link_to('Unfollow', following_path(id: user.id), class: 'btn btn-secondary btn-sm', method: :delete)
      end
    else
      link_to('Edit your profile', edit_user_registration_path(user), class: 'btn btn-success btn-sm')
    end
  end
end
