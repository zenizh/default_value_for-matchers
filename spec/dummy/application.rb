$:.unshift File.expand_path('../../../lib', __FILE__)

require 'action_controller/railtie'
require 'active_record'

require 'default_value_for'
require 'default_value_for/matchers'

module Dummy
  class Application < Rails::Application
    config.secret_token = 'abcdefghijklmnopqrstuvwxyz0123456789'
    config.session_store :cookie_store, key: '_dummy_session'
    config.eager_load = false
    config.active_support.deprecation = :log
  end
end

Dummy::Application.initialize!

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

#
# Models
#

class User < ActiveRecord::Base
  default_value_for :name, 'no name'
  default_value_for :age, value: 20, allows_nil: false
end

#
# Migrates
#

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.integer :age

      t.timestamps null: false
    end
  end
end

CreateUsers.new.change
