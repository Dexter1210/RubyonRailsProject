class HomeController < ApplicationController
    def index

        #try to search for views/controllername/index.html.erb
       # render plain: "This is index page"
       @categories=Category.all.includes(:posts)
       @tags=Tag.all
       @posts=Post.published.order_by_latest #This variable can be accessed on html page

    end

    def read
        @post=Post.find(params[:id])
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

