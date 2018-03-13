require 'pg'

class Link
  def self.all
    connection = PG.connect :dbname => 'bookmark_manager', :user => 'christopher'
    result = connection.exec "SELECT url FROM links"
    result.map { |link| link['url'] }
  end
end
