class EmailProcessor
  def self.process(email)
    Bookmark.create!({ burl: email.body, title: email.from })
  end
end