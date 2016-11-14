Sequel.migration do
  up do
    add_column :metrics, :calibration, Float, default: 0.0
  end

  down do
    drop_column :metrics, :calibration
  end
end
