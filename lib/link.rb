require 'pg'

class Link
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end
    result = connection.exec "SELECT url FROM links"
    result.map { |link| link['url'] }
  end

  def self.add(new_url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end
    connection.exec "INSERT INTO links (url) VALUES('#{new_url[:url]}')"
  end
end
