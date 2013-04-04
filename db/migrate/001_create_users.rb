class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # required by authlogic
      t.string            :login                           # 登录帐号
      t.string            :crypted_password     
      t.string            :password_salt        
      t.string            :persistence_token    
      t.integer           :login_count,     :default => 0  # 登录次数
      t.datetime          :last_request_at
      t.datetime          :last_login_at                   # 上次登录时间 
      t.datetime          :current_login_at                # 当前登录时间
      t.string            :last_login_ip                   # 上次登录IP
      t.string            :current_login_ip
      # end required

      t.integer           :role_id
      t.string            :name                            # 帐号姓名
      t.timestamps
    end

    add_index :users,  :login
    add_index :users,  :role_id
  end
end
