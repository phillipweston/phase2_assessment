get '/' do
	redirect '/profile' if current_user
  erb :index
end

get '/profile' do
	if current_user

		erb :profile
	else
		redirect '/'
	end
end

post '/update' do
	content_type :json

	trip = Trip.find(params[:id])
	trip.increment!(:times)
	{ id: trip.id, times: trip.times }.to_json
end


post '/calculate' do

	origin = params[:origin_address].gsub(/ /, '_').gsub(/\W/, '').gsub(/_/, '+')
	destination = params[:destination_address].gsub(/ /, '_').gsub(/\W/, '').gsub(/_/, '+')

	url = "http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{origin}&destinations=#{destination}&mode=driving&units=imperial&language=en-EN&sensor=false"

	results = JSON.parse(Net::HTTP.get(URI.parse(url)))

	distance = results['rows'][0]['elements'][0]['distance']['text'].to_i
	origin = results['origin_addresses'][0].gsub(/\s\d{5}.*/, '')
	destination = results['destination_addresses'][0].gsub(/\s\d{5}.*/, '')
	
	route = Route.find_or_create_by_origin_and_destination_and_distance(origin: origin, destination: destination, distance: distance)
	trip = Trip.find_or_create_by_route_id_and_user_id(user_id: current_user.id, route_id: route.id)


	redirect '/profile'
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
	user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
	if user
		session[:user_id] = user.id 
		redirect '/profile'
	else
		redirect '/'
	end
end

delete '/sessions/:id' do
	session.clear
	redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
	user = User.create(params[:user])
	if user
		session[:user_id] = user.id
		redirect '/profile'
	else
		erb :sign_up
	end
end


