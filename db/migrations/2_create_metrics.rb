Sequel.migration do
  up do
    create_table(:metrics) do
      primary_key :id
      String :name, null: false
    end

    add_column :points, :metric_id, Integer, null: false
  end

  down do
    drop_table(:metrics)
  end
end
