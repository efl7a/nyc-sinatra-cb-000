class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @titles = Title.all
    @figures = Figure.all
    erb :'landmarks/new'
  end

  post '/landmarks' do
    landmark = Landmark.create(params[:landmark])
    if !params[:figure][:name].empty?
      landmark.figure = Landmark.create(params[:landmark])
    end
    landmark.save
    redirect "landmarks/#{landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
      @landmark = Landmark.find(params[:id])
      @figures = Figure.all
      @titles = Title.all
      erb :'landmarks/edit'
    end

  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.name = params[:landmark][:name]
    landmark.year_completed = params[:landmark][:year_completed]
#    if !params[:figure][:name].empty?
#      landmark.figure = Figure.create(params[:figure])
#    else
#      landmark.figure = params[:landmark][:figure]
#    end
    landmark.save
    redirect "landmarks/#{landmark.id}"
  end
end
