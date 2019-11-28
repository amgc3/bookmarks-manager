require 'pg'

class Bookmark

  def self.all
    testing
    #Bookmarks.all returns a PG::Connetion object
    result = @connection.exec("SELECT * FROM bookmarks;")
    #we run a query on that connection and this returns a PG::Result
    result.map { |bookmark| bookmark['url'] }
    #we map over over result to get the urls
  end

  def self.adding_url(new_url)
    testing
    @connection.exec("INSERT INTO bookmarks (url) VALUES('#{new_url}') ;")
  end

  def self.testing
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      # connect on the PG object passing in the database name
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end
