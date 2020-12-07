class CreateStadiums < ActiveRecord::Migration[5.0]
    def change
        create_table :stadiums do |t|
            t.string :name
        end
    end
end