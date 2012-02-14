module ApplicationHelper

	def app
    "HYPRACTV"
  end
  
  def logo
    image_tag("logo.gif", :alt => HYPRACTV)
  end
  
  # Return a title on a per-page basis.
  def title
    base_title = app
    if @subtitle.nil?
      base_title
    else
      "#{base_title} | #{@subtitle}"
    end
  end
end
