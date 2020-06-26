class PostarticleImagesController < ApplicationController
	def edit
		@postarticle_image = PostarticleImage.find(params[:id])
	end

	def update
		@postarticle_image = PostarticleImage.find(params[:id])
		@postarticle_image.update(image_params)
		redirect_to postarticles_path
	end

	def create
		@postarticle = Postarticle.find(params[:a].to_i)
		@postarticle_image = PostarticleImage.new(image_params)
		@postarticle_image.postarticle_id = @postarticle.id
		if @postarticle_image.save
			redirect_to postarticle_path(@postarticle)
		else
			render postarticle_path(@postarticle)
		end
	end

	def destroy
	  	@postarticle_image = PostarticleImage.find(params[:id])
	  	@postarticle.destroy
	  	redirect_to postarticles_path, notice: "画像の削除に成功しました"
	  	redirect_back(fallback_location: root_path)
  	end

	private

  def image_params
  	params.require(:postarticle_image).permit(:image)
  end
end
