class CreateTesting < ActiveRecord::Migration
  def change
    create_table :testings do |t|
      t.string :name
    end
  end
end
