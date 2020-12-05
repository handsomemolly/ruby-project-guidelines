class Match < ActiveRecord::Base
    belongs_to :stadium
    belongs_to :team

    def self.tester
        puts 'lol'
    end

end

