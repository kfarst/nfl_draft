module OrdersHelper
  def team_name_if_last_pick_exists(pick)
    if pick.blank?
      return "None"
    else
      return pick.team
    end
  end
end
