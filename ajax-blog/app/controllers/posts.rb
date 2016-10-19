
get '/posts' do
  @posts = Post.all
  erb :'posts/index'
end

get '/posts/new' do
  authenticate!
  if request.xhr?
    erb :'posts/new', layout: false
  else
    erb :'posts/new'
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'posts/show'
end

delete '/posts/:id' do
  post = Post.find_by(id: params[:id])
  locked_obj(post)
  post.destroy
  if request.xhr?
    status 200
  else
    redirect '/posts'
  end
end

post '/posts' do
  authenticate!
  post = Post.new( title: params[:post][:title], content: params[:post][:content], points: 0, author: auth_user)

  if request.xhr?
    if post.save
      erb :'partials/_post', layout: false, locals: {post: post}
    else
      status 400
      errors = post.errors.full_messages
      content_type :json
      errors.to_json
    end
  else
    if post.save
      redirect '/posts'
    else
      @errors = post.errors.full_messages

      erb :'posts/index'
    end
  end
end
