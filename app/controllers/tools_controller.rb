require 'pry'
class ToolsController < ApplicationController

    def index
       @tools = Tool.all
        render json: @tools
    end
end
