class CreateEvents < ActiveRecord::Migration

  def change
	  create_table "events", :force => true do |t|
	    t.string   "title"
	    t.datetime "starttime"
	    t.datetime "endtime"
	    t.boolean  "all_day",         :default => false
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.text     "description"
	    t.integer  "event_series_id"
	    t.integer  "venue_id"
	    t.integer  "category_id"
	  end
  end

end
