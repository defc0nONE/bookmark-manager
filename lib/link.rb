require './lib/database_connection'

class Link
  def self.all
    result = DatabaseConnection.query "SELECT url FROM links"
    result.map { |link| link['url'] }
  end

  def self.add(new_url)
    return false unless is_url?(new_url[:url])
    DatabaseConnection.query "INSERT INTO links (url) VALUES('#{new_url[:url]}')"
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
