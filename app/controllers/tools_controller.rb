require 'pry'
class ToolsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_tool, only: [:show, :edit, :update, :destroy]
    
    #GET /tools
    def index
       @tools = Tool.all
        render json: @tools
    end
   
    #GET /tools/1
   def show
        
        render json: @tool
   end
   
   # GET /tool/new
   def new
      @tool = Tool.new
   end
   
   # GET /tools/1/edit
   def edit
   end
   
   # POST /tools
   # POST /tools.json
   def create
      @tool = Tool.new(tool_params)
      
      respond_to do |format|
         if @tool.save
            format.html { render json: @tool }
            format.json { render json: @tool, status: :created, location: @tool }
         else
            format.json { render json: @tool.errors, status: :unprocessable_entity }
         end
      end
      
   end
   
   # PATCH/PUT /tools/1
   # PATCH/PUT /tools/1.json
   def update
      respond_to do |format|
         if @tool.update(tool_params)
            format.html { render json: @tool }
            format.json { render :show, status: :ok, location: @tool }
         else
            format.json { render json: @tool.errors, status: :unprocessable_entity }
         end
      end
      
   end
   
   # DELETE /tools/1
   # DELETE /tools/1.json
   def destroy
      @tool.destroy
         respond_to do |format|
         format.json { render json: @tool }
      end
   end
   
   private
   
   # Use callbacks to share common setup or constraints between actions.
   def set_tool
      @tool = Tool.find(params[:id])
   end
   
   # Never trust parameters from the scary internet, only allow the white list through.
   def tool_params
      params.require(:tool).permit(:name, :description, :price, :url, :like, :id)
   end
end
