class Bookmark
  attr_reader :bookmarks
  def self.all
    @bookmarks = ["http://www.makersacademy.com",
    "http://www.destroyallsoftware.com",
    "http://www.google.com"]
  end


end
