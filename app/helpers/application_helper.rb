module ApplicationHelper
  def error_messages(model, type)
    content_tag(:ul, class: 'style-none') do
      model.errors[type].collect do |item|
        concat(content_tag(:li, item, class: 'text-danger error-text text-capitalize'))
      end
    end
  end

  def navbar
    content_tag(:ul, class: 'navbar-nav justify-content-end flex-row') do
      if user_signed_in?
        content_tag(:li, content_tag(:p, current_user.name,
                                     class: 'd-block mr-3 mt-3 py-1 font-weight-bold text-uppercase text-muted')) +
          content_tag(:li, link_to('Sign out',
                                   destroy_user_session_path,
                                   method: :delete, data: { confirm: 'Are you sure?' },
                                   class: 'btn btn-warning btn-sm mx-1'), class: 'nav-item active mt-3')

      end
    end
  end

  def to_follow
    ids = current_user.followed_users.pluck(:id) << current_user.id
    User.where.not(id: ids)
  end

  def follow_btns(user)
    return unless user != current_user
    if !current_user.followed_users.include?(user)
      link_to('Follow', followings_path(id: user.id), class: 'btn btn-primary btn-sm', method: :post)
    else
      link_to('Unfollow', following_path(id: user.id), class: 'btn btn-secondary btn-sm', method: :delete)
    end
  end

  def fav_btn(opinion)
    fav = Favorite.find_by(user_id: current_user.id, opinion_id: opinion.id)
    if fav
      link_to(content_tag(:i, nil, class: 'fa fa-heart red-color'), favorite_path(opinion.id), method: :delete)
    else
      link_to(content_tag(:i, nil, class: 'fa fa-heart grey-color'),
              favorites_path(opinion_id: opinion.id), method: :post)
    end
  end

  def edit_destroy(user, opinion)
    return unless user == current_user

    link_to('Edit', edit_opinion_path(opinion), class: 'text-muted mr-2') +
      link_to('Delete', opinion_path(opinion), class: 'text-muted mr-2', method: :delete)
  end

  def user_navbar 
    if user_signed_in? 
      content_tag(:div, class: 'w-75 d-flex mx-auto mt-3') do
        image_tag("prof-pic.jpg", class: 'cu-prof-pic') +
        content_tag(:p, current_user.name, class: 'cu-nav-name font-weight-bold ml-3 mt-3')
      end +
      content_tag(:div) do
        content_tag(:ul, class: 'row mx-0 px-0 mt-3 cu-ul') do
          content_tag(:li, class: 'col-lg-6') do
            content_tag(:p, current_user.followers.count, class: 'font-weight-bold text-center cu-counts mt-2 mb-1') +
            content_tag(:p, link_to('followers', followings_path(user_id: current_user.id, users: "followers")),
                        class: 'font-weight-bold text-center cu-counts-text text-capitalize')
          end +
          content_tag(:li, class: 'col-lg-6') do
            content_tag(:p, current_user.followed_users.count, class: 'font-weight-bold text-center cu-counts mt-2 mb-1') +
            content_tag(:p, link_to('following', followings_path(user_id: current_user.id, users: "following")),
                        class: 'font-weight-bold text-center cu-counts-text text-capitalize')
          end
        end
      end
    else
    end
  end

end
