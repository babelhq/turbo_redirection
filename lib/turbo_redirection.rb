# frozen_string_literal: true

require_relative "turbo_redirection/version"
require_relative "turbo_redirection/engine"
require_relative "turbo_redirection/break_out_of_frame"
require_relative "turbo_redirection/recede_on_web"
require_relative "turbo_redirection/redirect_without_turbo"

module TurboRedirection
  include BreakOutOfFrame
  include RecedeOnWeb
  include RedirectWithoutTurbo
end
