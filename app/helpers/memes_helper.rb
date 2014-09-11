module MemesHelper

	def get_social_tags
		raw('<a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
			<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?\'http\':\'https\';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+\'://platform.twitter.com/widgets.js\';fjs.parentNode.insertBefore(js,fjs);}}(document, \'script\', \'twitter-wjs\');</script>
			<iframe src="//www.facebook.com/plugins/like.php?href=' + request.original_url + '%2F&amp;width&amp;layout=button_count&amp;action=like&amp;show_faces=true&amp;share=true&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:21px;" allowTransparency="true"></iframe>')
	end

	def list_available_templates
		str = '<select class="image-picker show-html" name="meme[template_id]">'
		MemeTemplate.all.each do |d| 
			if d.isprivate != true
				str << '<option data-img-src="/uploads/meme_template/template_img/' + d.id.to_s + '/thumb_image.jpg" value="' + d.id.to_s + '">  ' + d.id.to_s + '  </option>'.to_s
			else 
				if current_user != nil && d.user_id == current_user.id 
					str << '<option data-img-src="/uploads/meme_template/template_img/' + d.id.to_s + '/thumb_image.jpg" value="' + d.id.to_s + '">  ' + d.id.to_s + '  </option>'.to_s
				end 
			end 
		end
		str << '</select>'
		return raw(str)
	end

	def get_meme_image_link id
		return '/uploads/generated_memes/' + id.to_s + '.jpg'
	end
end