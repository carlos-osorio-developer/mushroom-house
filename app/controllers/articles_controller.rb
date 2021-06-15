class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :logged_in_user, only: [:new, :edit, :update]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = current_user.articles.build(article_params.except(:category))

    respond_to do |format|
      if @article.save
        Listing.create(article_id: @article.id, category_id: article_params[:category])
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render json: @article.to_json }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end    
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params.except(:category))
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end  

  def search_results
    if params[:search].blank?
      redirect_to(search_page_path, alert: "Please enter a valid search") and return  
    else
      content = params[:search].downcase
      @results = Article.seach_content(content)
      render 'search'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:author_id, :title, :text, :image, :category)
    end
end
