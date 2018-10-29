class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: "creator_id"
  has_many :attendances, foreign_key: "attendee_id"
  has_many :attended_events, through: :attendances
  
  # Attends an event.
  def attend(event)
    attended_events << event
  end

  # Cancels an event.
  def cancel(event)
    attended_events.delete(event)
  end

  # Returns true if the current user is attending an event.
  def attending?(event)
    attended_events.include?(event)
  end
end
