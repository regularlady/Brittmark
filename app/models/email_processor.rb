class EmailProcessor
  def self.process(email)
    Bookmark.create!({ tag_list: email.body, burl: email.subject, title: email.body })
  end
end