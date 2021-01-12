class CreateFitnessEntries < ActiveRecord::Migration
  def change
    create_table :fitness_entries do |t|
      t.string :excersize_list 
      t.integer :user_id
        
      t.timestamps null: false
      #automatically gives me time stamp every time i create or edit a model
    end
  end
end
