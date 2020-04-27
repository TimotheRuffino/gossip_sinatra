require 'pry'
require 'csv'
require 'controller'
class Gossip
    attr_reader :author, :content

    def initialize(author, content) 
        @author = author
        @content = content
    end

    def save #def pour écrire dans le fichier CSV
        CSV.open("./db/gossip.csv", "ab") do |csv| #ouvre/créé le fichier csv
          csv << ["#{author}", "#{content}"] #intègre les changements dans le fichier csv
        end
      end

      def self.all #méthode qui récupère tous les CSV
        all_gossips = [] #intègre les potins dans un array
        CSV.read("db/gossip.csv").each do |csv_line| #parcours le fichier CSV
          all_gossips << Gossip.new(csv_line[0], csv_line[1]) #création objet Gossip avec son author et content
        end
        return all_gossips
      end

      def self.find(id) 
        idx = id.to_i
        puts idx
        all_gossips = Gossip.all
        return all_gossips[idx]
      end

end 
