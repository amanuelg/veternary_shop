class AddDefaultUser < ActiveRecord::Migration
  def self.up
    user = User.create!( :email => 'admin@admin.com', :user_type => 'admin', :password => 'admin' )
  end

  def self.down
    user = User.find_by_email( 'admin@admin.com' )
    user.destroy
  end
end
