class TasksController < ApplicationController
    before_action :require_user_logged_in
    before_action :correct_user, only: [:edit, :show, :update, :destroy]
    
    def index
        if logged_in?
            @pagy, @tasks = pagy(current_user.tasks.order(id: :desc), item: 25)
        end
    end

    def create
        @task = current_user.tasks.build(task_params)
    
        if @task.save
            flash[:success] = 'タスクを登録しました。'
            redirect_to root_url
        else
            @pagy, @tasks = pagy(current_user.tasks.order(id: :desc), item: 25)
            flash.now[:danger] = 'タスクの登録に失敗しました。'
            render :new
        end
    end

    def new
        @task = Task.new
    end

    def edit
      
    end

    def show
 
    end

    def update
    
        if @task.update(task_params)
            flash[:success] = 'タスクを更新しました。'
            redirect_to root_url
        else
            flash.now[:danger] = 'タスクの更新に失敗しました。'
        render :edit
        end
    end

  def destroy
    @task.destroy
    
    flash[:success] = "タスクは正常に削除されました"
    redirect_to tasks_url
  end
  
  
  private

  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
      unless @task
          redirect_to root_url
      end
  end  
end
