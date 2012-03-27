class ConjugationsController < ApplicationController
  # GET /conjugations
  # GET /conjugations.json
  def index
    @conjugations = Conjugation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conjugations }
    end
  end

  # GET /conjugations/1
  # GET /conjugations/1.json
  def show
    @conjugation = Conjugation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conjugation }
    end
  end

  # GET /conjugations/new
  # GET /conjugations/new.json
  def new
    @conjugation = Conjugation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conjugation }
    end
  end

  # GET /conjugations/1/edit
  def edit
    @conjugation = Conjugation.find(params[:id])
  end

  # POST /conjugations
  # POST /conjugations.json
  def create
    @conjugation = Conjugation.new(params[:conjugation])

    respond_to do |format|
      if @conjugation.save
        format.html { redirect_to @conjugation, notice: 'Conjugation was successfully created.' }
        format.json { render json: @conjugation, status: :created, location: @conjugation }
      else
        format.html { render action: "new" }
        format.json { render json: @conjugation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conjugations/1
  # PUT /conjugations/1.json
  def update
    @conjugation = Conjugation.find(params[:id])

    respond_to do |format|
      if @conjugation.update_attributes(params[:conjugation])
        format.html { redirect_to @conjugation, notice: 'Conjugation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @conjugation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conjugations/1
  # DELETE /conjugations/1.json
  def destroy
    @conjugation = Conjugation.find(params[:id])
    @conjugation.destroy

    respond_to do |format|
      format.html { redirect_to conjugations_url }
      format.json { head :no_content }
    end
  end
end
