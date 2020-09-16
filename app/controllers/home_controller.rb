class HomeController < ApplicationController
    def index

        #try to search for views/controllername/index.html.erb
       # render plain: "This is index page"
       @categories=Category.all.includes(:posts)
       @tags=Tag.includes(:posts)
       @posts=Post.includes(:tags).published.order_by_latest.page(params[:page]).per(5)
      
       

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
            @posts=result.blank? ? [] : result.first.posts.page(params[:params]).per(5)
        end
        render "home/index"
    end

    def category_search
        if params.has_key? (:category)
            result=Category.where(name: params[:category])
            @posts=result.blank? ? []: result.first.posts.page(params[:params]).per(5)
        end
        render "home/index"
    end

    def search
        q=params[:q]
        @posts=Post.where('title LIKE ?',"%#{q}%").page(params[:page]).per(5)
        render "home/index"
    end


   
      

    def contact
        @categories=Category.all
        @tags=Tag.all
    end



end

