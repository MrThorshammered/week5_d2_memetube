$(document).ready(function(){
  console.log('ready mofo');
  getVideos();


  $('#add-video').on('click', function(event){
  		createVideo();
  })

}) 

function getVideos(){

	request('GET', '/videos', null).done(function(response){

		$.each(response, function(index, title){
			console.log(title) //.title, title.url, title.description)
			appendNewVideo(title.title, title.url, title.description);
		})
	})
}


function appendNewVideo(title, url, description){
	$('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+ url +'" frameborder="0" allowfullscreen></iframe>').prependTo(".all-videos")
	$('<li> Description: ' + description +'</li>').prependTo(".all-videos")
	  $('<li> Title: ' + title +'</li>').prependTo(".all-videos")  
}


function createVideo(){
	data = {title: $('#newTitle').val(),url: $('#newUrl').val(), description: $('#newDescription').val()};
	$.post('/videos', data, function(response){
		getVideos(response);
		$('#newTitle').val('');
		$('#newUrl').val('');
		$('#newDescription').val('');
	})
}

function request(method, url, data){
	return $.ajax({
		method: method,
		url: url,
		dataType: 'json',
		data: data
	})
}