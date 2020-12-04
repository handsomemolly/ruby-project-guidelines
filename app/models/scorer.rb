class Scorer < ActiveRecord::Base
    belongs_to :team
    has_many :tournaments, through: :qualifiers 
   
end