require 'pry'
class ToolsController < ApplicationController

    def index
        @message = "Hello, how are you today?"
        render json: Tool.new
    end
end
