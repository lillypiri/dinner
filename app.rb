require 'sinatra'
require 'erb'
require 'yaml/store'

get '/' do
  choices = []
  @store = YAML::Store.new 'app.yml'
  @store.transaction do
    @store["choices"].each do |key, value|
      value.times do
        choices << key
      end
    end
  end

  @choice = choices.sample
  erb :index
end
