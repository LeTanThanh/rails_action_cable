class PagesController < ApplicationController
  skip_before_action :authenticase_user!

  def index; end
end
