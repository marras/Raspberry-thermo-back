Sequel.migration do
  up do
    create_table(:points) do
      primary_key :id
      Integer :value, null: false
      DateTime :day, null: false
    end
  end

  down do
    drop_table(:points)
  end
end
