class SightingsController < ApplicationController

    def show 
        sighting = Sighting.find_by(id: params[:id])
        #adding in some error messages 
        if sighting
            # create nested hashes with the bird hash and the location hash 
            render json: {id: sighting.id, bird: sighting.bird, location: sighting.location}
             # alternative 
            # render json: sightings, include: [:bird, :location]
        else 
            render json: {message: "No sighting found with that id"}
        end
    end

    def index
        sightings = Sighting.all 
        render json: sightings, include: [:bird, :location]
    end


    #example of a fully written out method of specific attributes in each hash without Ruby magic 
    #this is an overly complex example and will get out of hand with big sets 
    
    # def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     render json: sighting.to_json(:include => {
    #       :bird => {:only => [:name, :species]},
    #       :location => {:only => [:latitude, :longitude]}
    #     }, :except => [:updated_at])
    # end


end
