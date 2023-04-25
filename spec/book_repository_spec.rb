require 'book_repository'
require 'database_connection'

def reset_books_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_books_table
  end

  it "returns two books" do
    repo = BookRepository.new

    books = repo.all

    expect(books.length).to eq 2 # =>  2

    expect(books.first.id).to eq '1' # =>  1
    expect(books.first.title).to eq 'Piranesi' # =>  'Piranesi'
    expect(books.first.author_name).to eq 'Suzanne Clarke' # =>  'Suzanne Clarke'

    expect(books[1].id).to eq "2"
    expect(books[1].title).to eq 'Born a Crime'
    expect(books[1].author_name).to eq 'Trevor Noah'
  end
end

