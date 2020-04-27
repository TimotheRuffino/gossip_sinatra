require 'bundler'
Bundler.require

require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  get '/gossips/new' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    ##Gossip.new(author, content).save
    ##Gossip.new("super_auteur", "super gossip").save
    ##Gossip.new.save
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  
    #puts "Ceci est le contenu du hash params : #{params}"
    #puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
    #puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
  end

  get '/gossips/:id' do
    puts "Potin numéro #{params['id']} choisi : "
    erb :show, locals: {gossips: Gossip.find(params['id'].to_i)}
  end
#binding.pry

end 
