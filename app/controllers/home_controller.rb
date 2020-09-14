class HomeController < ApplicationController
    def index

        #try to search for views/controllername/index.html.erb
       # render plain: "This is index page"
       @categories=Category.all.includes(:posts)
       @tags=Tag.includes(:posts)
       @posts=Post.includes(:tags).published.order_by_latest #This variable can be accessed on html page
       

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

    def tag_search
        if params.has_key? (:tag)
            result=Tag.where(name: params[:tag])
            #@posts=Tag.find_by(name: params[:tag]).first.posts
            @posts=result.blank? ? [] : result.first.posts
        end
        render "home/index"
    end

   
      

    def contact
        @categories=Category.all
        @tags=Tag.all
    end



end

