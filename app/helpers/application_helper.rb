module ApplicationHelper

	def login_helper style = ''
		if current_user.is_a?(GuestUser)
			(link_to "Register", new_user_registration_path, class: style)+
	 		" ".html_safe +
	  		(link_to "Login", new_user_session_path, class: style) 
	  	else
	 		link_to "Logout", destroy_user_session_path, method: :delete, class: style

	  end
	end

	def source_helper
		if session[:source]
			greeting = "Thanks for visiting me from #{session[:source ]}"
      content_tag(:p, greeting, class: "source-greeting")
    	end
	end

def nav_items
	[
		{
			url:root_path,
			title: 'Home'
		},
		{
			url:about_path,
			title: 'About'
		},
		{
			url:contact_path,
			title: 'Contact'
		},
		{
			url:blogs_path,
			title: 'Blog'
		},
		{
			url:portfolios_path,
			title: 'Portfolio'
		}
	]

	end

	def nav_helper style, tag_type
		nav_links = ''

		nav_items.each do |item|
			nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
	
		end

		nav_links.html_safe
	end

	def active? path
		"active" if current_page? path
	end


	def alerts
		alert = (flash[:alert] || flash[:error] || flash[:notice])
		if alert
			alert_generator alert
		end
	end

	def alert_generator msg
		js add_gritter(msg, sticky: false) 
	end

	# def background_generator
		
	# 	if current_page?(controller: 'pages', action: "home")

	# 	 video_tag(
 #            'frontpage2.mp4',
 #            id: 'background',
 #            autoplay: true,
 #            loop: false,
 #            muted: true,
      
 #          )
         	
 #     	else

        
 #     	image_tag "background", id: 'background'
    
	# 	end
	# end

end