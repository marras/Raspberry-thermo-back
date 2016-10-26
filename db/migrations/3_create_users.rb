Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String :name, null: false
      String :encrypted_password, null: false
    end

    add_column :metrics, :user_id, Integer, null: false
  end

  down do
    drop_table(:users)
  end
end

