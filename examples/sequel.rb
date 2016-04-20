require 'sequel'

require 'storage/adapters/sequel/users'
require 'storage/repositories/users'

DB ||= Sequel.sqlite

DB.create_table :users do
  primary_key :id
  String :name
  Integer :age
end

users = Storage::Repositories::Users.new(
  adapter: Storage::Adapters::Sequel::Users.new(dataset: DB[:users]),
)

# --insert --------------------------------------------------------------------

new_user = ->(name, age) {
  Storage::Entities::User.new { |user|
    user.name = name
    user.age = age
  }
}

bob = new_user.call('Bob', 10)
sam = new_user.call('Sam', 16)
joe = new_user.call('Joe', 21)

users.persist bob
users.persist sam
users.persist joe

# -- all ----------------------------------------------------------------------

users.all.each do |user|
  puts user.inspect
end

# -- find ---------------------------------------------------------------------

user = users.find(bob.id)

puts user.inspect

# -- query --------------------------------------------------------------------

users.younger_than(age: 13).each do |user|
  puts "coppa: #{user.inspect}"
end

users.minors.each do |user|
  puts "minor: #{user.inspect}"
end

# -- update -------------------------------------------------------------------

user.name = 'Rob'
user.age = rand(100)

users.persist user

puts user.inspect

# -- verify -------------------------------------------------------------------

user = users.find(user.id)

puts user.inspect

# -- destroy ------------------------------------------------------------------

users.destroy user

begin
  user = users.find(user.id)
rescue Storage::Repositories::Repository::NotFound
  puts :deleted
end
