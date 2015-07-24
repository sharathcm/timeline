class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Task.all
    @task = Task.new
  end

  def new
    @task = Task.new
    respond_to do |format|
        format.js
      end
  end

  def create
    @task = Task.new(todo_params)
    
    if @task.save
      render :index
    end

  end
  
end
