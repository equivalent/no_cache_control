require "no_cache_control/version"

module NoCacheControl
  def self.included(base)
    begin
      base.before_action :set_no_cache_control
    rescue NoMethodError
      base.before_filter :set_no_cache_control
    end
  end

  def set_no_cache_control
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"

    # Pragma and Expires are not a true header defined in RFC, however some browsers accepts them
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = '-1'
  end
end

ActionController::Base.send(:include, NoCacheControl)
