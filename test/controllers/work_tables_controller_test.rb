require 'test_helper'

class WorkTablesControllerTest < ActionDispatch::IntegrationTest
=begin
  setup do
    @work_table = work_tables(:one)
  end

  test "should get index" do
    get work_tables_url, as: :json
    assert_response :success
  end

  test "should create work_table" do
    assert_difference('WorkTable.count') do
      post work_tables_url, params: { work_table: { date: @work_table.date, work_type: @work_table.work_type, worker_id: @work_table.worker_id } }, as: :json
    end

    assert_response 201
  end

  test "should show work_table" do
    get work_table_url(@work_table), as: :json
    assert_response :success
  end

  test "should update work_table" do
    patch work_table_url(@work_table), params: { work_table: { date: @work_table.date, work_type: @work_table.work_type, worker_id: @work_table.worker_id } }, as: :json
    assert_response 200
  end

  test "should destroy work_table" do
    assert_difference('WorkTable.count', -1) do
      delete work_table_url(@work_table), as: :json
    end

    assert_response 204
  end
=end
end
