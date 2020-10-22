module ApplicationHelper
  def error_messages(model, type)
    content_tag(:ul, class: 'pl-1') do
      model.errors[type].collect do |item|
        concat(content_tag(:li, item, class: 'text-danger error-text ml-0'))
      end
    end
  end

  def navbar
    content_tag(:ul, class: 'navbar-nav justify-content-between flex-row w-100') do
      if user_signed_in?
        image_tag('speech-bubble.png', class: 'nav-logo') +
          content_tag(:li, link_to('Sign out',
                                   destroy_user_session_path,
                                   method: :delete, data: { confirm: 'Are you sure?' },
                                   class: 'btn btn-warning btn-sm mx- align-self-center'), class: 'd-flex')
      else
        image_tag('speech-bubble.png', class: 'nav-logo')
      end
    end
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
      user_nav_signedin
    else
      user_nav_notsignedin
    end
  end

  def user_nav_signedin
    content_tag(:div, class: 'w-75 d-flex mx-auto mt-3') do
      image_tag('prof-pic.jpg', class: 'cu-prof-pic') +
        content_tag(:p, link_to(current_user.name, user_path(current_user)),
                    class: 'cu-nav-name font-weight-bold ml-3 mt-4')
    end +
      content_tag(:div) do
        content_tag(:ul, class: 'row mx-0 px-0 mt-3 cu-ul') do
          content_tag(:li, class: 'col-lg-6') do
            content_tag(:p, current_user.followers.count, class: 'font-weight-bold text-center cu-counts mt-2 mb-1') +
              content_tag(:p, link_to('followers', followings_path(user_id: current_user.id, users: 'followers')),
                          class: 'font-weight-bold text-center cu-counts-text text-capitalize')
          end +
            content_tag(:li, class: 'col-lg-6') do
              content_tag(:p, current_user.followed_users.count,
                          class: 'font-weight-bold text-center cu-counts mt-2 mb-1') +
                content_tag(:p, link_to('following', followings_path(user_id: current_user.id, users: 'following')),
                            class: 'font-weight-bold text-center cu-counts-text text-capitalize')
            end
        end
      end
  end

  def user_nav_notsignedin
    content_tag(:div, class: 'h-100 welcome-container mx-auto d-flex flex-column justify-content-center') do
      content_tag(:h1, 'Welcome to TwiTEC!', class: 'font-weight-bold welcome-text text-center align-middle') +
        image_tag('speech-bubble.png', class: 'welcome-pic text-center d-block align-self-center')
    end
  end
end
