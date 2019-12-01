require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      # NO LONGER USE THIS TO ADD DATA
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")

      # we add the test data using the .adding_url
      bookmark = Bookmark.adding_url(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.adding_url(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.adding_url(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

    end
  end

  describe '.adding_url' do
    it 'can add a bookmark to the list' do
      bookmark = Bookmark.adding_url(url: "http://www.netflix.com", title: "Netflix")
      persisted_data = persisted_data(id: bookmark.id)
      # defined as follows in database_helpers.rb
      # def persisted_data(id:)
      #   connection = PG.connect(dbname: 'bookmark_manager_test')
      #   connection.query("SELECT * FROM bookmarks WHERE id = '#{id}';")
      # end

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Netflix'
      expect(bookmark.url).to eq 'http://www.netflix.com'
    end
  end
end
