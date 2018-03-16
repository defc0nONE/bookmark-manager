require './lib/database_connection'

class Link
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query "SELECT * FROM links"
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.add(new_url)
    return false unless is_url?(new_url[:url])
    DatabaseConnection.query "INSERT INTO links (url, title) VALUES('#{new_url[:url]}', '#{new_url[:title]}')"
  end

  def self.delete(id)
    DatabaseConnection.query "DELETE FROM links WHERE id = #{id}"
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
