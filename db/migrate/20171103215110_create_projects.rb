class CreateProjects < ActiveRecord::Migration[5.1]
  def up
    create_table :projects do |t|
      t.string :name

      t.timestamps
    end

    add_index :projects, 'lower(name)', unique: true
  end

  def down
    drop_table :projects
  end
end
