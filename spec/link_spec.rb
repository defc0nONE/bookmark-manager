require 'link'

describe Link do
  describe '.all' do
    it 'returns all links' do
      links = Link.all
      expect(links).to include("http://www.makersacademy.com")
      expect(links).to include("http://www.google.com")
      expect(links).to include("http://www.facebook.com")
    end
  end

  describe '.create' do
    it 'doesn\'t create a new link if the URL isn\'t valid' do
      Link.add(url: 'blah blah')

      expect(Link.all).not_to include 'blah blah'
    end
  end
end
