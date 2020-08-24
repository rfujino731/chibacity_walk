class SearchController < ApplicationController
	def search
    search_colums = params[:keyword] == "title"? 'title LIKE ?':'address LIKE ?'
    @postarticles = Postarticle.where(search_colums, "%#{params[:searchword]}%").page(params[:page]).per(10).reverse_order
  end
end
