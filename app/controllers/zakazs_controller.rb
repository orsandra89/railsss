class ZakazsController < ApplicationController
  #тільки коли зарєганий юзер, то можна робити все(в межах розумного, звичайно)), а так лише можна переглядати індексну сторінку і шов
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_zakaz, only: [:show, :edit, :update, :destroy]

 
  def index
    @zakazs = Zakaz.all
  end


  def show
  end


  def new
    @zakaz = Zakaz.new
  end


  #add find_by(id) letter
  def edit
  end

  #створює,вписує в базу даних по zakaz_params 
  def create
    @zakaz = Zakaz.new(zakaz_params)

    respond_to do |format|
      if @zakaz.save
        format.html { redirect_to @zakaz, notice: 'Zakaz was successfully created.' }
        format.json { render :show, status: :created, location: @zakaz }
      else
        format.html { render :new }
        format.json { render json: @zakaz.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @zakaz.update(zakaz_params)
        format.html { redirect_to @zakaz, notice: 'Zakaz was successfully updated.' }
        format.json { render :show, status: :ok, location: @zakaz }
      else
        format.html { render :edit }
        format.json { render json: @zakaz.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @zakaz.destroy
    respond_to do |format|
      format.html { redirect_to zakazs_url, notice: 'Zakaz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zakaz
      @zakaz = Zakaz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    
    def zakaz_params
      params.require(:zakaz).permit(:user_id,:name, :phone, :dish, :drink, :adress)
    end
end
