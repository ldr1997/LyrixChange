class CommentsController < ApplicationController
	before_action :find_demo!

	def new
		@comment = Comment.new
	end

	def create
	    @comment = @demo.comments.new(comment_params)
	    @comment.user = current_user
	    # @comment = @demo.comments.create(params[:comment].permit(:comment))

		if @comment.save
			redirect_to demo_path(@demo)
		else
			render :new
		end
	end

	private

	def find_demo!
	  	@demo = Demo.find(params[:demo_id])
	end

	def comment_params
		params.require(:comment).permit(:comment_text)
	end
end
