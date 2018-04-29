class AdminsController < ApplicationController
 before_action :set_admin, only: [:show, :edit, :update, :destroy] # this means before you call the actions 'show, edit, update, destroy' call the method 'set_admin' through this method we can detect the admin 'id' that we want to display it

  def index # the default page when we type admins in the browser
    @admins=Admin.all.order("last_name ASC") # bring me all the data inside Admin table ------ now we need the 'View (index.html.erb)'
                       # '@' to make it able to call through the view 'instance var' they are visible everywhere in the object admins
  end
  def show
  end

  def new
    @admin=Admin.new #intanse of Admin we need it to creat new admin
  end

  def edit
  end

  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params) # here we want when the user click on 'create admin' it will make new 'Admin' instance and (admin_params) take the parameter that the user insert in the new form site

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end

  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin # to know exactly the admin that we want to 'edit, destroy, update, show' by tracking the ID thats why we have used 'before_action'
      @admin = Admin.find(params[:id]) # it will search the admin that exist in parameter that inserted ---- here he can finde the admin by id parameter and return it to show
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params # IMPORTANT without it the intered parameter will not save to our platform
      params.require(:admin).permit(:first_name, :last_name, :age, :salary, :DOB) # require means that 'first_name, last_name, age' should be inserted from the user to successfuly add the record to our database
    end
# (:first_name, :last_name, :age, :salary, :DOB) ALL REQUIRED

# all this actions 'index, show, new, edit, destroy' we can call them like (CRUD)
# (index) need some data to passed to his (view) 

# model is the center of data