get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new.?' do
	@params = params
	@errors = session[:errors]
	session.clear
	erb :event_redo
end

post '/events/create' do
	event = Event.create(params)
	if event.valid?
		redirect '/'
	else
		session[:errors] = event.errors.full_messages
		redirect "/events/new?title=#{params[:title]}&date=#{params[:date]}&organizer_name=#{params[:organizer_name]}&organizer_email=#{params[:organizer_email]}"
	end
end
