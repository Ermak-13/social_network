class Statistics < ActiveRecord::Base
  belongs_to :user
  
  class << self
    def user_added(user)
      Statistics.create(:user => user, :action => "added")
    end
    
    def user_removed(user)
      Statistics.create(:user => user, :action => "removed")
    end
    
    def get_number_of_users(date)
      result=Statistics.where("action = 'added' and created_at < ?", date).count - 
        Statistics.where("action = 'removed' and created_at < ?", date).count
      Rails.logger.debug result
      result
    end
    
    def get_chart_data
      data = []
      @statistics=Statistics.where("created_at >= ? and created_at <= ?", 
                                      3.weeks.ago, Time.now).all
      number_of_users=Statistics.get_number_of_users(3.weeks.ago)
      @statistics.each do |record|
        number_of_users += record.action == 'added' ? 1 : -1
        data.push [record.created_at.to_i * 1000, number_of_users]
      end
      data
    end
    
  end  
end
