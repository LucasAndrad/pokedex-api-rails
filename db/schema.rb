# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171210201212) do

  create_table "pokemon_catcheds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "level"
    t.integer "experience"
    t.bigint "pokemon_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_pokemon_catcheds_on_pokemon_id"
    t.index ["user_id"], name: "index_pokemon_catcheds_on_user_id"
  end

  create_table "pokemons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "number"
    t.string "name"
    t.string "type_1"
    t.string "type_2"
    t.integer "total"
    t.integer "hp"
    t.integer "attack"
    t.integer "defense"
    t.integer "sp_atk"
    t.integer "sp_def"
    t.integer "speed"
    t.integer "generation"
    t.boolean "legendary"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "age"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
