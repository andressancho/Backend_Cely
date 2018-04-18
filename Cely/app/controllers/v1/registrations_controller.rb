class V1::RegistrationsController < ApplicationController
  protect_from_forgery with: :null_session


    def create

      user = User.new(name: params[:name], email: params[:email],password: params[:password])
      if user.save
        render json: {status: 'Success',message: 'New user', data:user},status: :created
      else
      render json: {status: "Error", message:user.errors}
      end
    end

end
