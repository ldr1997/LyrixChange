class CommentsController < ApplicationController
	before_action :find_demo!, :user_logged_in

	def new
		user_logged_in
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

	def edit
		@demo = Demo.find(params[:demo_id])
		@comment = @demo.comments.find(params[:id])
	end

	def update
		@demo = Demo.find(params[:demo_id])
		@comment = @demo.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:comment_text))
	        redirect_to @demo, notice: 'Comment successfully updated.'
		else
			render 'edit'
		end
	end

	def destroy
		@demo = Demo.find(params[:demo_id])
		@comment = @demo.comments.find(params[:id])
		@comment.destroy
		redirect_to demo_path(@demo), notice: 'Comment successfully deleted.'
	end

	private

	def find_demo!
	  	if @comment
	  		@demo = @comment.demo
	  	else
	  		@demo = Demo.find(params[:demo_id])
	  	end
	end

	def comment_params
		params.require(:comment).permit(:comment_text)
	end
end
