require 'sinatra'

get '/' do
  erb :first_page
end

post '/names' do
	first_name = params[:first]
	last_name = params[:last]
	# p "#{first_name}, #{last_name}"
	redirect '/second_page?first_name=' + first_name + '&last_name=' + last_name
end

get '/second_page'  do
	first_name = params[:first_name]
	last_name = params[:last_name]
	erb :second_page, locals:{first: first_name, last: last_name}
end

post '/info' do
	first_name = params[:first]
	state = params[:state]
	city = params[:city]
	str = params[:street]
	zip = params[:zip]

	# p "#{state},#{city},#{first_name},#{str},#{zip}"
	redirect '/third_page?first_name=' + first_name + '&state=' + state + '&city=' + city + '&str=' + str + '&zip=' + zip 
end

get '/third_page' do
	first_name = params[:first_name]
	state = params[:state]
	city = params[:city]
	str = params[:str]
	zip = params[:zip]

	erb :third_page, locals:{first: first_name, state: state, city: city, street: str, zip: zip}
end

post '/numbers' do
	first_name = params[:first]
	state = params[:state]
	city = params[:city]
	str = params[:street]
	zip = params[:zip]
	fav1 = params[:fav1]
	fav2 = params[:fav2]
	fav3 = params[:fav3]

	fav4 = fav1.to_i + fav2.to_i + fav3.to_i
	p "#{fav4}"

	redirect '/final_page?first_name=' + first_name + '&state=' + state + '&city=' + city + '&str=' + str + '&zip=' + zip + '&fav4=' + fav4.to_s
end

get '/final_page' do
	first_name = params[:first_name]
	state = params[:state]
	city = params[:city]
	str = params[:str]
	zip = params[:zip]
	fav1 = params[:fav1]
	fav2 = params[:fav2]
	fav3 = params[:fav3]

	fav4 = params[:fav4]
	p "#{fav4}"
	
	erb :final_page, locals:{first: first_name, state: state, city: city, street: str, zip: zip, fav1: fav1, fav2: fav2, fav3: fav3, fav4: fav4}
end