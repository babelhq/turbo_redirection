# frozen_string_literal: true

require "active_support/concern"
require_relative "turbo_redirection/version"
require_relative "turbo_redirection/break_out_of_frame"
require_relative "turbo_redirection/recede_on_web"
require_relative "turbo_redirection/redirect_without_turbo"

module TurboRedirection
  extend ActiveSupport::Concern

  include BreakOutOfFrame
  include RecedeOnWeb
  include RedirectWithoutTurbo
end
