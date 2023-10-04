module TurboRedirection::RecedeOnWeb
  # This module changes behavior of `recede_or_redirect_to ..` to respond
  # with a Turbo Stream that clears the cache and navigates back using history.
  #
  # Normally, this would only happen on native, but we want to emulate a native-ish
  # feeling on the web.
  #
  # Example:
  #
  #  class MatchAnswersController < ApplicationController
  #   def edit
  #     ...
  #     recede_or_redirect_to match_answers_path
  #   end
  #  end
  #
  # This would trigger a 'recede' action on native, while on the web it would
  # respond with a Turbo Stream that clears the cache and navigates back using history.
  #

  def turbo_native_action_or_redirect(url, action, redirect_type, options = {})
    if !turbo_native_app? && request.format.turbo_stream? && action == :recede
      render "turbo_redirection/#{action}"
    else
      super
    end
  end
end
