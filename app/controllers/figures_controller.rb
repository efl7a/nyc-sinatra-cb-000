class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    newbie = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      newbie.title_ids = Title.create(params[:title]).id
    end
    if !params[:landmark][:name].empty?
      newbie.landmark_ids = Landmark.create(params[:landmark]).id
    end
    newbie.save
    redirect "figures/#{newbie.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
      @figure = Figure.find(params[:id])
      @titles = Title.all
      @landmarks = Landmark.all
      erb :'figures/edit'
    end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.name = params[:figure][:name]
    figure.title_ids = params[:figure][:title_ids]
    figure.landmark_ids = params[:figure][:landmark_ids]
    if !params[:title][:name].empty?
      figure.title_ids = Title.create(params[:title]).id
    end
    if !params[:landmark][:name].empty?
      figure.landmark_ids = Landmark.create(params[:landmark]).id
    end
    figure.save
    redirect "figures/#{figure.id}"
  end

#  get '/figures/:slug' do
#    @figure = Figure.find_by_slug(params[:slug])
#    erb :'figures/show'
#  end

#  get '/figures/:slug/edit' do
#    @figure = Figure.find_by_slug(params[:slug])
#    erb :'figures/edit'
#  end
end
