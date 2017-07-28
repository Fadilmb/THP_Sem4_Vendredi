class CorsairesController < ApplicationController
  def index
    @corsaires = Corsaire.all
  end

  def new
    @corsaire = Corsaire.new
  end

  def create
    @corsaire = Corsaire.new(corsaire_params)
    if @corsaire.save
      flash[:success] = "Welcome to the Hacking Project!"
      redirect_to @corsaire
    else
      flash[:danger] = @corsaire.errors.messages
      redirect_to new_corsaire_path
    end
  end

  def show
    @corsaire = Corsaire.find(params[:id])
  end

  def edit
    @corsaire = Corsaire.find(params[:id])
  end

  def update
    update_done = Corsaire.find(params[:id]).update(corsaire_params)
    if update_done
      flash[:success] = "Status updated!"
      redirect_to corsaire_path
    else
      flash[:danger] = Corsaire.find(params[:id]).errors.messages
      redirect_back fallback_location: @corsaire
    end
  end

  def destroy
    Corsaire.find(params[:id]).destroy
    redirect_to corsaires_path
  end

  private

  def corsaire_params
    params.require(:corsaire).permit(:first_name, :age, :bio, :slack_handle, :github_handle, :likeness)
  end

end
