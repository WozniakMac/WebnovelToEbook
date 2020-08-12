# frozen_string_literal: true

class WebnovelSelectorReflex < ApplicationReflex
  def select
    @webnovel_id = session[:webnovel_id] = element[:value].start_with?("Select") ? nil : element[:value]
  end
end
