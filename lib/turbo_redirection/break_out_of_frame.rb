
module TurboRedirection::BreakOutOfFrame
  # This module adds support for breaking out of a Turbo Frame (or targeting a specific frame)
  # from the server. It does so by responding with a Turbo Stream that will perform the visit.
  #
  # It will clear the cache for the frame if the request is a POST, PUT, PATCH, or DELETE,
  # which is similar to how a normal Turbo Drive Form submission works.
  #
  # The module here emulates the behavior of the PR here:
  #
  #   https://github.com/hotwired/turbo-rails/pull/367/files
  #
  # which is not yet merged.
  #
  # Example usage:
  #
  #  class MatchAnswersController < ApplicationController
  #    def create
  #     ...
  #     redirect_to match_answers_path, turbo_frame: "_top"
  #    end
  #  end
  #
  # This would redirect to the match_answers_path and break out of any frames.
  # A POST to this URL will also clear the cache before visiting.
  #

  def redirect_to(options = {}, response_options = {})
    turbo_frame = response_options.delete(:turbo_frame)
    turbo_action = response_options.delete(:turbo_action)

    location = url_for(options)

    if request.format.turbo_stream? && turbo_frame
      turbo_clear_cache = request.post? || request.put? || request.patch? || request.delete?

      render  "turbo/streams/redirect",
              location: location,
              status: :created,
              locals: {
                location: location,
                turbo_frame: turbo_frame,
                turbo_action: turbo_action,
                turbo_clear_cache: turbo_clear_cache
              }
    else
      super
    end
  end
end
