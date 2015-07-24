class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Task.all
    # raise params.inspect
    # @task = Task.new
    # if task_params
      # @task = Task.find_by_task_date(task_params[:task_date]) if task_params
      # @task = Task.new if not task_params
    # else
      @task = Task.new
    # end
    
    
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    # raise params.inspect
    @task = Task.new 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  def copy_day
    @task = Task.where("task_date = ?",params[:date]).first
    if @task.present?
      @copy_task = Task.new(name: @task.name, project_id: @task.project_id, hours: @task.hours, task_date: @task.task_date+1)
      @copy_task.save
    end  
    redirect_to tasks_url
  end 

  def copy_week
    
  end  

  # POST /tasks
  # POST /tasks.json
  def create
    # raise params.inspect
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_url
    else
      format.html { render :new }
      format.json { render json: @task.errors, status: :unprocessable_entity }

    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to action: "index" }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :project_id, :hours,:task_date) unless params[:task].nil?
  end
end
