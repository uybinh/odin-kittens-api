module API
  class KittensController < ApplicationController
    before_action :set_kitten, only: [:show, :update, :destroy]

    def index
      @kittens = Kitten.all
      json_response(@kittens)
    end

    def create
      @kitten = Kitten.create!(kitten_params)
      json_response(@kitten, :created)
    end

    def show
      json_response(@kitten)
    end

    def update
      @kitten.update(kitten_params)
      json_response(@kitten)
    end

    def destroy
      @kitten.destroy
      head :no_content
    end

    private
    def kitten_params
      params.permit(:name, :age, :cuteness, :softness)
    end

    def set_kitten
      @kitten = Kitten.find(params[:id])
    end
  end
end