Sequel.migration do
  up do
    drop_column :metrics, :name
    drop_column :metrics, :sensor_id

    add_column :metrics, :name, String
    add_column :metrics, :sensor_id, String, null: false
  end

  down do
  end
end

