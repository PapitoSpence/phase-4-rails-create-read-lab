class PlantsController < ApplicationController
    def index
        plants = Plants.all
        render json: plants
    end

    def show
        plants = Plants.find_by(id: params[:id])
        if plant
            render json: plant, status: 200
        else
            render json: {error: "Plant not found"}, status: 404
        end
    end

    def create
        plants = Plant.create(plant_params)
        render json: plant, status: 201
    end

    private

    def plants_params
        params.permit(:name, :image, :price)
    end
end