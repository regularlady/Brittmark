module BookmarksHelper
  def EmbedlyURL
    obj = embedly_api.oembed :url => 'http://#{bookmark.burl}'
    puts obj[0].marshal_dump
    json_obj = JSON.pretty_generate(obj[0].marshal_dump)
    puts json_obj
  end
end
