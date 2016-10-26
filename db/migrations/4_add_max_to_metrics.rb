Sequel.migration do
  up do
    add_column :metrics, :max, Integer, null: false, default: 3
  end

  down do
    remove_column :metrics, :max
  end
end
