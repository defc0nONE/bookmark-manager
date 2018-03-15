require 'link'

describe Link do
  describe '.all' do
    it 'returns an array of all link instances' do
      links = Link.all
      expect(links[0]).to be_an_instance_of(Link)
    end

    it 'returns link instances with id attribute' do
      links = Link.all
      expect(links[0].id).to eq('1')
    end

    it 'returns link instances with url attribute' do
      links = Link.all
      expect(links[1].url).to eq('http://www.google.com')
    end

    it 'returns link instances with title attribute' do
      links = Link.all
      expect(links[2].title).to eq('Facebook')
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

  describe '.delete' do
    it 'deletes an a link by id' do
      link_zero = Link.all[0]
      Link.delete(link_zero.id)
      expect(Link.all).not_to include link_zero
    end
  end

  describe '.update' do
    it 'can update a url' do
      link_one = Link.all[1]
      Link.update(link_one.id,:url,'www.stackoverflow.com')
      expect(Link.all[1].url).to eq ('www.stackoverflow.com')
    end

    it 'can update a title' do
      link_two = Link.all[2]
      Link.delete(link_two.id,:title,'ALL IN CAPS')
      expect(Link.all[2].url).to eq ('ALL IN CAPS')
    end

    it 'returns false for invalid update field' do
      link_one = Link.all[1]
      expect(Link.update(link_one.id,:invalid_field,'rainbows')).to eq(false)
    end
  end

  describe '.find' do
    it "can return a link from it's title" do
      expect(Link.find('Google')).to eq(Link.all[1])
    end
  end
end
