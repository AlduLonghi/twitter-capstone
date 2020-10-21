module OpinionsHelper
  def show_form(user)
    render partial: 'shared/opinion-form' if user == current_user
  end
end
