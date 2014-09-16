class CreateCircleMembers < ActiveRecord::Migration
  def change
    create_table :circle_members do |t|
      t.integer  :circle_id
      t.integer  :circle_member_id
      t.datetime :created_at
    end

  end
end
