class book
  attr_accessor :id, :title, :body
  def self.open_connection
    conn = PG.connect(dbname:"postgres", user:"postgres")
  end

  def self.find id
    conn = self.open_connection
    sql = "SELECT * FROM post WHERE id = #{id}"
    result = conn.exec (sql)
    book = self.hydrate result [0]
    book
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM book ORDER BY id"
    result = conn.exec(sql)

    books = result.map do |tuple|
      self.hydrate tuple
    end
    books
  end
  def self.hydrate book_data
    book = Book.new
    book.id = book_data['id']
    book.title = book_data['title']
    book.body = book_data['body']
    return book
  end


end #end of class
