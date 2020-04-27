require 'bundler'
Bundler.require

require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all} #page d'accueil du site listant tous les potins
  end
  
  get '/gossips/new' do #lien vers la page de création de potins / Entrée
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save #def pour créer les potins / Sortie
    redirect '/' #redirection vers la page d'index
  end

  get '/gossips/:id/' do #trouver un potin en particulier pour afficher la page show
    id = params["id"].to_i
    erb :show, locals: {gossip: Gossip.find(id), id: id}
  end


  
end 
