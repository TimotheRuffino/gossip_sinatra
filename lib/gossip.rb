require 'pry'
require 'csv'
require 'controller'
class Gossip
    attr_reader :author, :content

    def initialize(author, content)
        @author = author
        @content = content
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
          #csv << ["Mon super auteur", "Ma super description"]
          csv << ["#{author}", "#{content}"]
        end
      end

      def self.all
        all_gossips = []
        CSV.read("db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
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
