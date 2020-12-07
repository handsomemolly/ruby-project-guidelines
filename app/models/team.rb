class Team < ActiveRecord::Base
    has_many :matches
    has_many :stadiums, through: :matches

end

# class Stadium < ActiveRecord::Base
#     has_many :matches
#     has_many :teams, through: :matches

# end

# class Match < ActiveRecord::Base
#     belongs_to :stadium
#     belongs_to :teams
# end

#-----------------------------------------------------------------------------------------------------------
#SEED FILE

# Team.destroy_all
# Stadium.destroy_all
# Match.destroy_all

# t1 = Team.create(name: 'Liverpool')
# t2 = Team.create(name: 'Manchester United')

