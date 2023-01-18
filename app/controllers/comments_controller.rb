class CommentsController < ApplicationController


  def create
      @post = Post.find(params[:post_id])
      #puts comment_params
      @comment = @post.comments.new(comment_params)
      @comment.commenter = current_user
      respond_to do |format|
        if @comment.save
          format.html { redirect_to post_path(@post), notice: 'Comment was successfully created.' } # changed the redirect to @post
        end
      end
    end
  
    
    def destroy

      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      respond_to do |format|
        if @comment.destroy
          format.html {redirect_to post_path(@post), notice: 'Comment was successfully deleted.', status: :see_other }
        end
      end
    end
    
    private
      def comment_params
        params.require(:comment).permit(:body)
      end

  end
  