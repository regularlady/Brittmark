module ApplicationHelper
  def control_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'control-group error'
    else
      content_tag :div, capture(&block), class: 'control-group'
    end
  end

  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge :renderer => BootstrapLinkRenderer
    end
    super *[collection_or_options, options].compact
  end

  def embedly_url(url)
    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_KEY'], :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'

    obj = embedly_api.oembed :url => url
    image_tag(obj[0]["thumbnail_url"])
   
  end
end
