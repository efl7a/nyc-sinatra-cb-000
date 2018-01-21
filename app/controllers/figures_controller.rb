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
      newbie.titles = Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      newbie.landmarks = Landmark.create(params[:landmark])
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
      erb :'figures/edit'
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
