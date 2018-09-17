class PostController < Sinatra::Base

  # require "sinatra"
  # require "sinatra/reloader" if development?
  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # $posts = [
  #   {id: 0,
  #   title: "p1",
  #   body: "body of post1"
  #   },
  #   {id: 1,
  #   title: "p2",
  #   body: "body of post2"
  #   },
  #   {id: 2,
  #   title: "p3",
  #   body: "body of post3"
  #   }
  # ]

    get "/test" do
      Post.all.to_yaml
    end


  get "/" do
    @posts = Post.all
    erb :'posts/index'
  end

  get "/new" do
    @post = {
      id: "",
      title: "",
      body: ""
    }
    erb :'posts/new'
  end

  get "/:id" do
    # "<h1>Hello, #{params[:id]}</h1>"
    id = params[:id].to_i
      # @post = $posts[id]
      @post = Post.find id
      erb :'posts/post'
  end

  get '/:id/edit' do
    id = params[:id].to_i
    @post = $posts[id]
    erb :'posts/edit'
  end


  post "/"  do
    new_post = {
      id: $posts.length,
      title: params[:title],
      body: params[:body]
    }
    $posts.push new_post
    redirect "/"
  end

  put '/:id' do
    id = params[id].to_i
    post =$posts[id]
    post[:title] = params[:title]
    post[:body] = params[:body]
    redirect '/'
  end

  delete '/:id' do
    id = params[:id].to_i
    $posts.delete_at id
    redirect '/'
  end




end #end of class
