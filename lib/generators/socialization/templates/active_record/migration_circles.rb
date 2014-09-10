class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.string  :name
      t.integer :circle_owner_id
      t.datetime :created_at
    end
  end
end
