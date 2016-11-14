Sequel.migration do
  up do
    add_column :metrics, :calibration, Float, default: 0.0
  end

  down do
    remove_column :metrics, :calibration
  end
end
