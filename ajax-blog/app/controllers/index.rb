get '/' do
  redirect '/posts'
end

get '/404' do
	erb :'404'
end