class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :worker_id
      t.string :worker_name

      t.timestamps
    end
  end
end
