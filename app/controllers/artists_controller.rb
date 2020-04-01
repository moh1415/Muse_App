class ArtistsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  before_action :find_artist, except: [:index, :new, :create]
    def index
        @artists = current_user.artists.all
    end
    def show
        @artist = Artist.find(params[:id])
        @songs = @artist.songs
        if @artist.user != current_user
          flash[:notice] = 'Not allowed!'
          redirect_to artists_path
        end
      end
    def new
     @artist = Artist.new
    end
    def create
        @artist =Artist.create(params.require(:artist).permit(:name, :albums, :hometown, :img))
        @artist.user = current_user
        if @artist.save
            redirect_to @artist
            else
                render 'new'
        end
        # redirect_to artists_path
      end
      def edit
        @artist = Artist.find(params[:id])
      end
      def update
        artist = Artist.find(params[:id])
        artist.update(params.require(:artist).permit(:name, :albums, :hometown, :img))
          
        redirect_to artist
      end
      def destroy
        Artist.find(params[:id]).destroy
      
        redirect_to artists_path
      end
      private 
      def artist_params
          params.require(:artist).permit(:name, :albums, :hometown, :img)
      end
      def find_artist
        @todo = Artist.find(params[:id])
      end
end
