class OwnershipsController < ApplicationController
  def chosen_draft_picks
    @ownerships = Ownership.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
