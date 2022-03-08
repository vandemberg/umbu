get '/users' do
  list = UseCase::UsersList.new(params).all
  list.to_json
end

post '/users' do
end

get '/users/:id' do
end

put '/users/:id' do
end

delete '/users/:id' do
end
