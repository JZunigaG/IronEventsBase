
class UsersController < ApplicationController

	before_action :set_user,only: [:show,:edit,:update]



	def index

		@users = User.all

		respond_to do |format|

			format.html

			format.json

		end
	end


	def show

	end


	def edit


	end


	def update

		if @user.update update_params

			redirect_to @user, notice: "#{@user.email} updated"

		else
			render 'edit'
		end
	end


	private

		def set_user

			@user = User.find(params[:id])

		end


		def update_params

			# llama al metodo admin_param del modelo User con el valor pasado del check box
			params.require(:user).permit(:admin_param)

		end
end
