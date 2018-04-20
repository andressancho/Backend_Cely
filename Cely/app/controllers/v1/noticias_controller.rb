class V1::NoticiasController < ApplicationController

  protect_from_forgery with: :null_session



  def create

    user = user= User.where(id: params[:id]).first
    token = params[:authentication_token]
    if (user.authentication_token == token)
      user.authentication_token=nil
      user.save
      noticia = Document.new(title: params[:title], userId: params[:id])
      if noticia.save
        render json: {status: 'Success',message: 'Nueva noticia', data:noticia, authentication_token:user.authentication_token},status: :created
      else
        render json: {status: "Error", message: "Error"}
      end
    else
      render json: {status: "Error", message: "Token invalido"}
    end
  end

  def add
    user = user= User.where(id: params[:id_user]).first
    token = params[:authentication_token]

      user.authentication_token=nil
      user.save
      linea= Linea.new(document_id: params[:id], texto: params[:texto], posicion: params[:position], tipo: params[:tipo], imagen: params[:imagen])
      if linea.save
        render json: {status: 'Success',message: 'Nueva linea de noticia', data:linea, authentication_token:user.authentication_token},status: :created
      else
        render json: {status: "Error", message: "Error"}
      end


  end

  def index
    user = user= User.where(id: params[:id_user]).first
    token = params[:authentication_token]
    if (user.authentication_token == token)
      user.authentication_token=nil
      user.save
      list_noticias = Document.where(userId: params[:id_user])
      #render json: {status: 'Success',message: 'Lista de noticias', data:{list_noticias.each} authentication_token:user.authentication_token},status: :ok


      render json: {status: 'Success',message: 'Lista de noticias', data:list_noticias, authentication_token:user.authentication_token},status: :ok


    else
      render json: {status: "Error", message: "Token Invalido"}
    end

  end

  def getLines
    user = user= User.where(id: params[:id_user]).first
    token = params[:authentication_token]
    if (user.authentication_token == token)
      user.authentication_token=nil
      user.save
      list_lineas = Linea.where(document_id: params[:id])

      render json: {status: 'Success',message: 'Lista de lineas', data:list_lineas, authentication_token:user.authentication_token},status: :ok


    else
      render json: {status: "Error", message: "Token Invalido"}
    end

  end

end
