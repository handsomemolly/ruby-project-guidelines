# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_12_06_213753) do

  create_table "arenas", force: :cascade do |t|
    t.string "name"
  end
=======
ActiveRecord::Schema.define(version: 2020_12_04_231443) do
>>>>>>> 616085ca262f061dd861c34677135b8e21050369

  create_table "matches", force: :cascade do |t|
    t.datetime "date"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.integer "home_team_goals"
    t.integer "away_team_goals"
<<<<<<< HEAD
    t.integer "arena_id"
=======
    t.integer "stadium_id"
  end

  create_table "stadiums", force: :cascade do |t|
    t.string "name"
>>>>>>> 616085ca262f061dd861c34677135b8e21050369
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
  end

end
