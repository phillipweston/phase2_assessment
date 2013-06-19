get '/' do
	@notes = Note.all
  erb :index
end

post '/addnote' do
	@note = Note.create(title: params[:title], content: params[:content])
	erb :note, :layout => false
end

delete '/:id' do |id|
	puts Note.delete(id)
	"deleted note #{id}"
end	

put '/:id' do
	content_type :json

	note = Note.find(params[:id])
	note.update_attributes!(title: params[:title], content: params[:content])
	
	{ title: note.title, content: note.content }.to_json
end