class HomeController < ApplicationController
    def index

        #try to search for views/controllername/index.html.erb
       # render plain: "This is index page"

    end

    def ok

        #try to search for views/controllername/index.html.erb
        render plain: "ok"

    end


end

