class V1::SessionsController < ApplicationController
   protect_from_forgery with: :null_session
   skip_before_action :verify_authenticity_token
  def create
    user= User.where(email: params[:email]).first
    if user
      if user.valid_password?(params[:password])
        user.authentication_token=nil
        user.save
        render json: {status: 'Success',message: 'Logged in', data:user},status: :created
      else
        render json: {status: "Error", message: "Contraseña incorrecta"}
      end
    else
      render json: {status: "Error", message:"Usuario inexistente"}
    end

  end

  def fb
    user= User.where(email: params[:email]).first

    if user
       render json: {status: 'Success',message: 'Logged in', data:user},status: :created
    else
      user = User.new(name: params[:name], email: params[:email],password: params[:password])
      if user.save
        render json: {status: 'Success',message: 'New user', data:user},status: :created
      else
      render json: {status: "Error", message:user.errors}
      end

    end
  end




end
