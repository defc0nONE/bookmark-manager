require './lib/database_connection'

class Link
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def self.all
    result = DatabaseConnection.query "SELECT * FROM links"
    result.map { |link| Link.new(link['url']) }
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
