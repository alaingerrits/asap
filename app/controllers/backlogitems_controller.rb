class BacklogitemsController < ApplicationController
  before_action :set_backlogitem, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /backlogitems
  # GET /backlogitems.json
  def index
    # @backlogitems = Backlogitem.all
    @backlogitems = Team.find_by_id(current_user.team_id).backlogs.first.backlogitems
  end

  # GET /backlogitems/1
  # GET /backlogitems/1.json
  def show
  end

  # GET /backlogitems/new
  def new
    @backlogitem = Backlogitem.new
  end

  # GET /backlogitems/1/edit
  def edit
  end

  # POST /backlogitems
  # POST /backlogitems.json
  def create
    @backlogitem = Backlogitem.new(backlogitem_params)
    @backlogitem.backlog_id = Team.find_by_id(current_user.team_id).backlogs.first.id

    respond_to do |format|
      if @backlogitem.save
        format.html { redirect_to @backlogitem, notice: 'Backlogitem was successfully created.' }
        format.json { render :show, status: :created, location: @backlogitem }
      else
        format.html { render :new }
        format.json { render json: @backlogitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backlogitems/1
  # PATCH/PUT /backlogitems/1.json
  def update
    respond_to do |format|
      if @backlogitem.update(backlogitem_params)
        format.html { redirect_to @backlogitem, notice: 'Backlogitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @backlogitem }
      else
        format.html { render :edit }
        format.json { render json: @backlogitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backlogitems/1
  # DELETE /backlogitems/1.json
  def destroy
    @backlogitem.destroy
    respond_to do |format|
      format.html { redirect_to backlogitems_url, notice: 'Backlogitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backlogitem
      @backlogitem = Backlogitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backlogitem_params
      params.require(:backlogitem).permit(:name, :description, :size, :targetdate)
    end
end
