class WorkTablesController < ApplicationController
  before_action :set_work_table, only: [:show, :update, :destroy]
  before_action :set_worker, only: :create

  # GET workers/:worker_id/work_tables
  def index
    @work_tables = WorkTable.all
    render json: @work_tables
  end

  # GET workers/:worker_id/work_tables/1
  def show
    render json: @work_table
  end

  # POST workers/:worker_id/work_tables
  def create
    WorkTable.find_or_create_by(worker_id: @worker.worker_id, date: params[:date], work_type: params[:work_type])
    render status: :created, date: params[:date], work_type: params[:work_type]
  end

  # PATCH/PUT workers/:worker_id/work_tables/1
  def update
    if @work_table.update(work_table_params)
      render json: @work_table
    else
      render json: @work_table.errors, status: :unprocessable_entity
    end
  end

  # DELETE workers/:worker_id/work_tables/1
  def destroy
    @work_table.destroy
  end

  # POST workers/:worker_id/work_tables/all
  def createAll
    @work_tables = params[:arrayData]
    @work_tables.each do |work_table|
      puts(work_table)
      WorkTable.find_or_create_by(worker_id: params[:worker_id], date: work_table[:date], work_type: work_table[:work_type])
    end

    render json: @work_tables, status: :created
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_table
      @work_table = WorkTable.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def work_table_params
    #  params.require(:work_table).permit(:worker_id, :date, :work_type)
    # end

    def set_worker
      @worker = Worker.find_by(params[:worker_id])
    end
end
