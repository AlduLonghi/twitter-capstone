module ApplicationHelper
    def navbar
        content_tag(:ul, class: 'navbar-nav justify-content-end') do
            if user_signed_in?
                content_tag(:li, link_to('Sign out',
                                        destroy_user_session_path,
                                         method: :delete, data: { confirm: 'Are you sure?' },
                                         class: 'btn btn-warning mx-1'), class: 'nav-item active')
            end
          end
    end
end
