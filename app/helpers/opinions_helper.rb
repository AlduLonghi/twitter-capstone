module OpinionsHelper
  def show_form(user)
    render partial: 'shared/opinion-form' if user == current_user
  end

  def edit_destroy(user, opinion)
    return unless user == current_user

    link_to('Edit', edit_opinion_path(opinion), class: 'text-muted mr-2') +
      link_to('Delete', opinion_path(opinion), class: 'text-muted mr-2', method: :delete)
  end

  def fav_btn(opinion)
    fav = Favorite.find_by(user_id: current_user.id, opinion_id: opinion.id)
    if fav
      content_tag(:span, class: 'd-flex') do
        link_to(content_tag(:i, nil, class: 'fa fa-heart red-color'), favorite_path(opinion.id), method: :delete) +
          (if opinion.favorites.count.positive?
             content_tag(:p, opinion.favorites.count, class: 'ml-2 fav-count font-weight-bold')
           end)
      end
    else
      content_tag(:span, class: 'd-flex') do
        link_to(content_tag(:i, nil, class: 'fa fa-heart grey-color'),
                favorites_path(opinion_id: opinion.id), method: :post) +
          (if opinion.favorites.count.positive?
             content_tag(:p, opinion.favorites.count, class: 'ml-2 fav-count font-weight-bold')
           end)
      end
    end
  end
end
