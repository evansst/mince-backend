class ChecklistsController < ApplicationController
    def index
        @checklists = Checklist.all
        render json: @checklists
    end

    def create
        @checklist = Checklist.create(
            name: params[:name]
        )
        redirect_to 'http://localhost:3000/checklists'
    end

    def destroy
        @checklist = Checklist.find(params[:id])
        @checklist.destroy 
        render json: {message: "Successfully destroyed the item"}
    end
end
