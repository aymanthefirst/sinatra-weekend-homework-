class Post
  attr_accessor :id, :title, :body
  def self.open_connection
    conn = PG.connect(dbname:"postgres", user:"postgres")
  end

  def self.find id
    conn = self.open_connection
    sql = "SELECT * FROM post WHERE id = #{id}"
    result = conn.exec (sql)
    post = self.hydrate result [0]
    post
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM post ORDER BY id"
    result = conn.exec(sql)

    posts = result.map do |tuple|
      self.hydrate tuple
    end
    posts
  end
  def self.hydrate post_data
    post = Post.new
    post.id = post_data['id']
    post.title = post_data['title']
    post.body = post_data['body']
    return post
  end


end #end of class
