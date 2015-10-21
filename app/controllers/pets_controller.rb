class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.all
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
    @customers = Customer.all
  end

  # GET /pets/1/edit
  def edit
    @customers = Customer.all
    @pet.last_visit_date = @pet.last_visit_date.strftime("%m/%d/%Y %I:%M %p")
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)
    @customers = Customer.all
    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
      @customers = Customer.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      valid = params.require(:pet).permit(:name, :pet_type, :breed, :age, :weight, :last_visit_date, :customer_id)
      date_format = "%m/%d/%Y %I:%M %p"
      valid[:last_visit_date] = valid[:last_visit_date] != "" ? DateTime.strptime(valid[:last_visit_date], date_format) : valid[:last_visit_date]
      return valid
    end
end
