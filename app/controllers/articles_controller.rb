class ArticlesController < ApplicationController
    include ArticlesHelper

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
       @article = Article.new 
    end
    
    def create
        # alternative 1
        # @article = Article.new
        # @article.title = params[:article][:title]
        # @article.body = params[:article][:body]
        
        # alternative 2
        # @article = Article.new(
        #     title: params[:article][:title],
        #     body: params[:article][:body]
        # )
        
        #alternative 3; uses 'Strong Parameters' in articles_helper
        @article = Article.new(article_params)
        @article.save 

        flash.notice = "Article '#{@article.title}' created!"
        redirect_to article_path(@article)
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' updated!" 
        
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:id])
        # puts @article

        flash.notice = "Article '#{@article.title}' destroyed!" 
        @article.destroy
        redirect_to articles_path
    end
end
