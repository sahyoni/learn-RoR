class LearningController < ApplicationController
  def index
  	@arr= ['moh','sah','ran','wan']
  end
  def home
  	#redirect_to(:controller=>"learning",:action=>"index")
  end
end
