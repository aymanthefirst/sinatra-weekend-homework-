require "sinatra"
require "yaml"
require "pg"
require "sinatra/reloader" if development?
require_relative "./controllers/post_controller.rb"
require_relative "models/post.rb"
use Rack::Reloader
use Rack::MethodOverride
run PostController
