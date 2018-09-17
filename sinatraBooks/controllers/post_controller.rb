class PostController < Sinatra::Base

  # require "sinatra"
  # require "sinatra/reloader" if development?
  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }


  configure :development do
    register Sinatra::Reloader
  end

  # $books = [
  #   {id: 0,
  #   title: "p1",
  #   description: "description of book"
  #   },
  #   {id: 1,
  #   title: "p2",
  #   description: "description of book2"
  #   },
  #   {id: 2,
  #   title: "p3",
  #   description: "description of book3"
  #   }
  # ]

  get "/test" do
        Book.all.to_yaml
      end

  get "/" do
    @books = Book.all
    erb :'books/index'
  end

  get "/new" do
    @book = {
      id: "",
      title: "",
      description: ""
    }
    erb :'books/new'
  end

  get "/:id" do
    # "<h1>Hello, #{params[:id]}</h1>"
    id = params[:id].to_i
      @book = Book.find id
      erb :'books/book'
  end

  get '/:id/edit' do
    id = params[:id].to_i
    @book = $books[id]
    erb :'books/edit'
  end


  post "/"  do
    new_book = {
      id: $books.length,
      title: params[:title],
      description: params[:description]
    }
    $books.push new_book
    redirect "/"
  end

  put '/:id' do
    id = params[id].to_i
    book =$books[id]
    book[:title] = params[:title]
    book[:description] = params[:description]
    redirect '/'
  end

  delete '/:id' do
    id = params[:id].to_i
    $books.delete_at id
    redirect '/'
  end


end #end of class
