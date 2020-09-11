class HomeController < ApplicationController
    def ok

        #try to search for views/controllername/index.html.erb
        render plain: "OK"

    end

end

