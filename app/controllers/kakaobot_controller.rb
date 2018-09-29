require 'date'
class KakaobotController < ApplicationController
  def keyboard
    render json: {type: 'buttons', buttons: ["오늘", "내일", "어제"]}
  end
  def message
    utterance = params[:content]
    
    targetDate = if(utterance.eql? "어제")
      Date.yesterday
    elsif(utterance.eql? "오늘")
      Date.today
    elsif(utterance.eql? "내일")
      Date.tomorrow
    else
      utterance
                 end

      getWorkSchedule(targetDate)

    if @WorkTable
      render json: {message:{text:"전상현의 "+@WorkTable.date.to_s+" 근무는 '"+@WorkTable.work_type+"' 입니다."}, message_button: {label: '전체보기', url: "localhost"}}
    else
      render json: {message:{text:"데이터가 없습니다. 관리자에게 문의하세요."}}
    end
  end

  private
  def getWorkSchedule (date)
    @WorkTable = WorkTable.find_by(date: date)
  end
end

