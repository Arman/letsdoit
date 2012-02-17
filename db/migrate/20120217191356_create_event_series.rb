class CreateEventSeries < ActiveRecord::Migration

  def change
	  	create_table "event_series", :force => true do |t|
	    t.integer  "frequency",  :default => 1
	    t.string   "period",     :default => "weeks"
	    t.datetime "starttime"
	    t.datetime "endtime"
	    t.boolean  "all_day",    :default => false
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  add_index "events", ["event_series_id"], :name => "index_events_on_event_series_id"
	  
  end

end
