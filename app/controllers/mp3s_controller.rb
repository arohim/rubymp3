
class Mp3sController < ApplicationController
  before_action :set_mp3, only: [:show, :edit, :update, :destroy]

  # GET /mp3s
  # GET /mp3s.json
  def index
    @mp3s = Mp3.all
  end

  # GET /mp3s/1
  # GET /mp3s/1.json
  def show
  end

  # GET /mp3s/new
  def new
    @mp3 = Mp3.new
  end

  # GET /mp3s/1/edit
  def edit
  end

  def playlist

  end

  # POST /mp3s
  # POST /mp3s.json
  def create


    @mp3 = Mp3.new(mp3_params)

    uploaded_io = params[:mp3][:title]

 
 
    @mp3[:title] = uploaded_io.original_filename
    respond_to do |format|
      if @mp3.save

        
        File.open(Rails.root.join('app/assets', 'music', uploaded_io.original_filename), 'wb') do 
         |file| file.write(uploaded_io.read)
        end

      #name =  uploaded_io.original_filename
       # directory = "app/assets/music"
        # create the file path
      #  path = File.join(directory, name)
        # write the file
      #  File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
      #
 


        format.html { redirect_to @mp3, notice: 'Mp3 was successfully created. '}
        format.json { render action: 'show', status: :created, location: @mp3 }
      else
        format.html { render action: 'new' }
        format.json { render json: @mp3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mp3s/1
  # PATCH/PUT /mp3s/1.json
  def update
    uploaded_io = mp3_params[:mp3][:title]
    @mp3temp[:title] = uploaded_io.original_filename

    respond_to do |format|
      if @mp3.update(@mp3temp)
        format.html { redirect_to @mp3, notice: 'Mp3 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mp3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mp3s/1
  # DELETE /mp3s/1.json
  def destroy
    @mp3.destroy
    respond_to do |format|
      format.html { redirect_to mp3s_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mp3
      @mp3 = Mp3.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mp3_params
      params.require(:mp3).permit(:title)
    end
end
