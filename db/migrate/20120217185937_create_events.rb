class CreateEvents < ActiveRecord::Migration

  def change
	  create_table "events" do |t|
	    t.string   "title"
	    t.datetime "starts_at"
	    t.datetime "ends_at"
	    t.text     "description"
	    t.integer  "venue_id"
	    t.integer  "category_id"

	    t.timestamps
	  end
  end

end

