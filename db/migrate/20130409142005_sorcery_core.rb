class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :full_name
      t.string :email,            :default => nil, :null => false # if you use this field as a username, you might want to make it :null => false.
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end