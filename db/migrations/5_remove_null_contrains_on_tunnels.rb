Sequel.migration do
  up do
    drop_column :tunnels, :address
    add_column :tunnels, :address, String
  end

  down do
    drop_column :tunnels, :address
    add_column :tunnels, :address, String, null: false
  end
end
