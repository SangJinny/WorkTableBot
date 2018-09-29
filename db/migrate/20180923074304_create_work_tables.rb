class CreateWorkTables < ActiveRecord::Migration[5.2]
  def change
    create_table :work_tables do |t|
      t.string :worker_id
      t.date :date
      t.string :work_type

      t.timestamps
    end
  end
end
