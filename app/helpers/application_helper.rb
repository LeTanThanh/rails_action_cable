module ApplicationHelper
  def alert_class type
    case type.to_s
    when "notice"
      "success"
    when "alert"
      "danger"
    else
      type
    end
  end
end
