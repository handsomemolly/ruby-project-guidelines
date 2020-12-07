class Team < ActiveRecord::Base
    has_many :matches
<<<<<<< HEAD
    has_many :arenas, through: :matches

    


end



=======
    has_many :stadiums, through: :matches

end
>>>>>>> 616085ca262f061dd861c34677135b8e21050369
