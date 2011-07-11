class Video < ActiveRecord::Base
  belongs_to :user
  has_attached_file :video

  validates_attachment_presence :video
  validates_attachment_content_type :video, :content_type => 'video/quicktime'
  
  acts_as_state_machine :initial => :pending
  state :pending
  state :converting
  state :converted, :enter => :set_new_filename
  state :error
  
  event :convert do
    transitions :from => :pending, :to => :converting
  end
  
  event :converted do
    transitions :from => :converting, :to => :converted
  end
  
  event :failed do
    transitions :from => :converting, :to => :error
  end
  
  def convert
    self.convert!
    success = system(convert_command)
    if success && $?.exitstatus == 0
      self.converted!
    else
      self.failure!
    end
  end

  protected
    def convert_command
      flv = File.join(File.dirname(source.path), "#{id}.flv")
      File.open(flv, 'w')
      
      command = <<-end_command
        ffmpeg -i #{ source.path } -ar 22050 -ab 32 -acodec mp3 
      -s 480x360 -vcodec flv -r 25 -qscale 8 -f flv -y #{ flv }
      end_command
      command.gsub!(/\s+/, " ")
    end
    
    # This update the stored filename with the new flash video file
    def set_new_filename
      update_attribute(:video_file_name, "#{id}.flv")
    end
    
end
