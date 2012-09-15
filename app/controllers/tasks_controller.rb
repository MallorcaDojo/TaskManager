class TasksController < ApplicationController
  
  def move_task
    $task_id = params[:task_id]
    $new_status = params[:status]
    $user = ApplicationController.current_user
    #$user = session[:current_user_id]
    
    $task = Task.find($task_id)
    $task.status = $new_status
    $task.user = $user
    render :text => $task.save
  end

  
  def administration
    @tasks = Task.all
    render action: "index"
    #respond_to do |format|
    #  format.html {}
    #end
  end
  
  def checkList(status)
    if status
      return status.tasks
     else
      return Array.new
    end
  end
  
  # GET /tasks
  # GET /tasks.json
  def index
    status_unassigned = Status.find_by_name("Unassigned")    
    @unassigned = checkList(status_unassigned)  

    status_implementing = Status.find_by_name("Implementing")
    @implementing = checkList(status_implementing)
    
    status_testing = Status.find_by_name("Testing")
    @testing = checkList(status_testing)
    
    status_completed = Status.find_by_name("Completed")
    @completed = checkList(status_completed)
    
    status_pending = Status.find_by_name("Pending")
    @pending = checkList(status_pending)
     

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @tasks }
    end
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

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
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
end
