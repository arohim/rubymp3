class BackendsController < ApplicationController
  before_action :set_backend, only: [:show, :edit, :update, :destroy]

  # GET /backends
  # GET /backends.json
  def index
    @backends = Backend.all
  end

  # GET /backends/1
  # GET /backends/1.json
  def show
  end

  # GET /backends/new
  def new
    @backend = Backend.new
  end

  # GET /backends/1/edit
  def edit
  end

  # POST /backends
  # POST /backends.json
  def create
    @backend = Backend.new(backend_params)

    uploaded_io = params[:backend][:mp3file]

    @backend[:mp3file] = uploaded_io.original_filename

    respond_to do |format|
      if @backend.save

        File.open(Rails.root.join('app/assets', 'music', uploaded_io.original_filename), 'wb') do 
         |file| file.write(uploaded_io.read)
        end

        format.html { redirect_to @backend, notice: 'Backend was successfully created.' }
        format.json { render action: 'show', status: :created, location: @backend }
      else
        format.html { render action: 'new' }
        format.json { render json: @backend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backends/1
  # PATCH/PUT /backends/1.json
  def update
    respond_to do |format|
      if @backend.update(backend_params)
        format.html { redirect_to @backend, notice: 'Backend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @backend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backends/1
  # DELETE /backends/1.json
  def destroy
    @backend.destroy
    respond_to do |format|
      format.html { redirect_to backends_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend
      @backend = Backend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_params
      params.require(:backend).permit(:title, :artist, :album, :cover, :mp3file)
    end
end
