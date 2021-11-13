class User::FunsController < ApplicationController
  def new
  end

  def index
    @funs = Fun.all
  end

end
