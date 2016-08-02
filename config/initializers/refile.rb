require "refile"
Refile.configure do |config|
  connection = lambda { |&blk| ActiveRecord::Base.connection_pool.with_connection { |con| blk.call(con.raw_connection) } }
  config.store = Refile::Postgres::Backend.new(connection)
end

if Rails.env.production?
  Refile.cdn_host = 'https://salty-temple-56361.herokuapp.com/'
else
  Refile.cdn_host = 'https://775fbd34.ngrok.io'
end
