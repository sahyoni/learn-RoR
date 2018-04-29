class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = Resume.all
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
    extension=@resume.title.split('.') # to detect the extension of the file after the '.' (.pdf, .doc ....)
    send_file Rails.root.join('public', 'uploads',@resume.title), # give me the complete file path in our uploads file
     :type=>"application/#{extension[1]}", :x_sendfile=>true
  end

  # GET /resumes/new
  def new
    @resume = Resume.new
  end

  # GET /resumes/1/edit
  def edit
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = Resume.new(resume_params)

    #save file to the server
    uploaded_io = params[:resume][:title] # search inside resume about some thing called title and give me the file bath 'uploaded_io'
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), "wb") do |file|  # 'rails.root' means give me where i saved this project -> then in the file public create new file 'uploads' then the name of file
      file.write(uploaded_io.read)
      end
      @resume.title=uploaded_io.original_filename # here to save the vile as his original name

      respond_to do |format|
        if @resume.save
          format.html { redirect_to @resume, notice: 'Resume was successfully created.' }
          format.json { render :show, status: :created, location: @resume }
        else
          format.html { render :new }
          format.json { render json: @resume.errors, status: :unprocessable_entity }
        end
      end
    end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:cover_letter, :title)
    end
end
