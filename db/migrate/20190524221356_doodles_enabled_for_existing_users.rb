class DoodlesEnabledForExistingUsers < ActiveRecord::Migration[5.2]
  def self.up
    User.find_each do | user |
      user.settings['enable_doodle'] = true;
      user.save
    end
  end
  
  def self.down
    execute "DELETE FROM settings WHERE var = 'enable_doodle'"
  end
end
