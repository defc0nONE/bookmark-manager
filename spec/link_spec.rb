require 'link'

describe Link do
  describe '.all' do
    it 'returns all links' do
      links = Link.all
      urls = links.map(&:url)
      expect(urls).to include("http://www.makersacademy.com")
      expect(urls).to include("http://www.google.com")
      expect(urls).to include("http://www.facebook.com")
    end
  end

  describe '.create' do
    it 'creates a new link' do
      Link.add(url: 'http://www.instagram.com')
      links = Link.all
      urls = links.map(&:url)
      expect(urls).to include 'http://www.instagram.com'
    end

    it 'doesn\'t create a new link if the URL isn\'t valid' do
      Link.add(url: 'blah blah')
      links = Link.all
      urls = links.map(&:url)
      expect(urls).not_to include 'blah blah'
    end
  end
end
