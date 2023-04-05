class StaticPagesController < ApplicationController
  before_action :authorized, only: [:show, :new, :edit]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end
end
