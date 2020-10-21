module OpinionsHelper
 def show_form(user)
   if user == current_user
     render partial: 'shared/opinion-form'
   end
 end

end
