class WorkTablesController < ApplicationController
  before_action :set_work_table, only: [:show, :update, :destroy]
  before_action :set_worker, only: [:create, :update]

  # GET workers/:worker_id/work_tables
  def index
    @work_tables = WorkTable.all
    render json: @work_tables, status: :ok
  end

  # GET workers/:worker_id/work_tables/1
  def show
    render json: @work_table, status: :ok
  end

  # POST workers/:worker_id/work_tables
  def create
    @work_table = WorkTable.find_or_create_by(worker_id: @worker.worker_id, date: params[:date], work_type: params[:work_type])
    render json: @work_table, status: :created
  end

  # PATCH workers/:worker_id/work_tables
  def update
      @work_tables.each do |work_table|
        if work_table.update(worker_id: @worker.worker_id, date: params[:date], work_type: params[:work_type])
        else
          render json: @work_tables.errors, status: :unprocessable_entity
        end
      end
    else
    render json: @work_tables, status: :ok
  end

  # DELETE workers/:worker_id/work_tables/1
  def destroy
    @work_table.destroy
  end

  # POST workers/:worker_id/work_tables/all
  def createAll
    @work_tables = params[:arrayData]
    @work_tables.each do |work_table|
      WorkTable.find_or_create_by(worker_id: params[:worker_id], date: work_table[:date], work_type: work_table[:work_type])
    end

    render json: @work_tables, status: :created
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_work_table
    if params[:id]
      @work_table = WorkTable.find(params[:id])
    elsif params[:date]
      @work_tables = WorkTable.where(date: params[:date]).limit(nil)
    end
  end

  def set_worker
    @worker = Worker.find_by(params[:worker_id])
  end
end
