class PagesController < ApplicationController

    def home 
     redirect_to index_path if logged_in?   
    end

end