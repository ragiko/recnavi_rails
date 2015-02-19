class CreateCorporations < ActiveRecord::Migration
  def change
    create_table :corporations do |t|
      t.string :recnavi_id
      t.string :name
      t.string :seminar_url
      t.string :schedule_html
      t.datetime :diff_detect_time

      t.timestamps
    end
  end
end
