module TurboRedirection::RedirectWithoutTurbo
  extend ActiveSupport::Concern

  # This module adds support for redirecting *and breaking out of Turbo* in response to a
  # Turbo Streams request. This is useful when you want to redirect to a page that does not
  # live on the same domain as our app and thus would fail to load in via Turbo.
  #
  # Example:
  #
  #  class CheckoutsController < ApplicationController
  #    respond_to :turbo_stream, :html
  #
  #    def create
  #     ...
  #     redirect_to "https://example.com", turbo: false, status: :see_other
  #    end
  # end
  #
  # This would redirect to the external URL and break out of Turbo.

  def redirect_to(options = {}, response_options = {})
    if request.format.turbo_stream? && response_options.delete(:turbo) == false
      location = url_for(options)

      render "turbo/streams/redirect_without_turbo", locals: { location: location }
    else
      super
    end
  end
end
