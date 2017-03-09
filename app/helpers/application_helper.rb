module ApplicationHelper
  def login_helper
    if current_user.is_a?(GuestUser)
       (link_to 'Register', new_user_registration_path) +
        '<br>'.html_safe +
        (link_to 'Login', new_user_session_path)
    else
       link_to 'Log Out', destroy_user_session_path, method: :delete 
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting from #{session[:source]}, you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: 'souce-greeting')
    end
  end

  def copyright_generator
    JHallViewTool::Renderer.copyright 'Jason Hall', 'All rights reserved'
  end
end
