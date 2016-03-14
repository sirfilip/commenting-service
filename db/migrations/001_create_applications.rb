Sequel.migration do 

  change do 

    create_table(:applications) do 
      primary_key :id
      String :name, :null => false
      String :token, :null => false, :unique => true
    end

  end


end
