class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all
    # @boxcolor = ["dark","warning"]
  end
  
  def index2
    @foods = Food.all
  end

  def index3
    @foods = Food.all
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)
    @food.iconid = (1..5).to_a.sample
    

    respond_to do |format|
      if @food.save
        if @food.number == '1'
          format.html { redirect_to '/foods', notice: 'Food was successfully created.' }
          format.json { render :show, status: :created, location: @food }
        elsif @food.number == '2'
          format.html { redirect_to index2_foods_path, notice: 'Food was successfully created.' }
          format.json { render :show, status: :created, location: @food }
        else
          format.html { redirect_to index3_foods_path, notice: 'Food was successfully created.' }
          format.json { render :show, status: :created, location: @food }
        end
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:title, :content, :image, :iconid, :number)
    end
end
