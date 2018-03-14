require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'connects to the database' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end


  describe '.query' do
    it 'sends a query to the database' do
      database = DatabaseConnection.setup('bookmark_manager_test')
      expect(database).to receive(:exec).with("SELECT url FROM links")
      DatabaseConnection.query("SELECT url FROM links")
    end
  end
end
