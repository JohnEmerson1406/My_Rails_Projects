class ExtractsController < ApplicationController
  before_action :set_extract, only: %w[ show edit update destroy ]

  # GET /extracts
  # GET /extracts.json
  def index
    @q = User.find(current_user.id).extracts.ransack(params[:q])
    @extracts = @q.result.page(params[:page]).per(10)
  end

  # GET /extracts/1
  # GET /extracts/1.json
  def show
  end

  # GET /extracts/new
  def new
    @extract = Extract.new
  end

  # GET /extracts/1/edit
  def edit
  end

  # POST /extracts
  # POST /extracts.json
  def create
    @extract = Extract.new(extract_params)
    @extract.user = current_user

    respond_to do |format|
      if @extract.save
        format.html { redirect_to @extract, notice: "Extract was successfully created." }
        format.json { render :show, status: :created, location: @extract }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @extract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extracts/1
  # PATCH/PUT /extracts/1.json
  def update
    respond_to do |format|
      if @extract.update(extract_params)
        format.html { redirect_to @extract, notice: "Extract was successfully updated." }
        format.json { render :show, status: :ok, location: @extract }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @extract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extracts/1
  # DELETE /extracts/1.json
  def destroy
    @extract.destroy
    respond_to do |format|
      format.html { redirect_to extracts_url, notice: "Extract was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extract
      @extract = Extract.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def extract_params
      params.require(:extract).permit(:user_id, :movement, :kind, :value)
    end
end
