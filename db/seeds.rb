if Doorkeeper::Application.count.zero?

  Doorkeeper::Application.create(name: 'frontend', redirect_uri: '', scopes: 'users')

end

User.create
