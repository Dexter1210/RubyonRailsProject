class HomeController < ApplicationController
    def index

        #try to search for views/controllername/index.html.erb
       # render plain: "This is index page"
       @categories=Category.all
       @tags=Tag.all
       @posts=["posts1","posts2"] #This variable can be accessed on html page

    end

    def ok

        #try to search for views/controllername/index.html.erb
        render plain: "ok"

    end
    def about
        @categories=Category.all
        @tags=Tag.all
    end

   
      

    def contact
        @categories=Category.all
        @tags=Tag.all
    end



end

