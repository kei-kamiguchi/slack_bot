require 'clockwork'
require 'active_support/time'
require File.expand_path('../boot', __FILE__)
require File.expand_path('../environment', __FILE__)

module Clockwork
  handler do |job|
    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
    notifier.ping("#{job}")
  end

  every(3.minute, 'Hello')
end
