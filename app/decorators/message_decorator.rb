class MessageDecorator < ApplicationDecorator
  delegate_all

  def format_created_at
    created_at.strftime "%I:%M %p %d-%b-%Y"
  end
end
