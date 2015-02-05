class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :description
      t.string :path
      t.datetime :end_date

      t.timestamps
    end
  end
end
