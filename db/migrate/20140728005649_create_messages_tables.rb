class CreateMessagesTables < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.string :name

      t.timestamps
    end
  end
end
