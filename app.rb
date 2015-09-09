require 'sinatra'
require 'sinatra/contrib/all'
require 'json'
require 'pg'
require 'pry'


get '/' do
  redirect to('/videos')
end

get '/videos' do
  'hello world'

	sql = 'select * from videos'
	@videos = run_sql(sql)

	if request.xhr?
		json @videos.entries
	else
 	 erb :index
	end
end


post '/videos' do
	sql = "insert into videos (title, url, description) values ('#{params[:title]}','#{params[:url]}', '#{params[:description]}')
	returning *"

	@video = run_sql(sql)

	if request.xhr?
		json @video.entries.first
	end
end


private
def run_sql(sql)
  conn = PG.connect(:dbname =>'memetube', :host => 'localhost')
  begin
    result = conn.exec(sql)
  ensure
    conn.close
  end

  result
end