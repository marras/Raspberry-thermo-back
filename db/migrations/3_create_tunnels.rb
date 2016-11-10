Sequel.migration do
  up do
    create_table(:tunnels) do
      primary_key :id
      String :address, null: false
    end
  end

  down do
    drop_table(:tunnels)
  end
end
