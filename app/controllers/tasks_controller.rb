class TasksController < ApplicationController
  
  
  def test
    @tasks = Task.all
    
    if @tasks.size == 0
      Task.new(:name=>"Task0",:description=>"Desc0").save
      Task.new(:name=>"Task1",:description=>"Desc1").save
      Task.new(:name=>"Task2",:description=>"Desc2").save
      Task.new(:name=>"Task3",:description=>"Desc3").save
      Task.new(:name=>"Task4",:description=>"Desc4").save
      Task.new(:name=>"Task5",:description=>"Desc5").save
   
      @tasks = Task.all     
    end
  end
  
  def administration
    @tasks = Task.all
    render action: "index"
    #respond_to do |format|
    #  format.html {}
    #end
  end
  
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
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
