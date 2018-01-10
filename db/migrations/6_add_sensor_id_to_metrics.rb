Sequel.migration do
  up do
    add_column :metrics, :sensor_id, String
  end

  down do
    drop_column :metrics, :sensor_id
  end
end

