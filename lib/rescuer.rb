require 'slack-notifier'

class Rescuer
  SLACK_WEBHOOK = "https://hooks.slack.com/services/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".freeze

  def initialize
    @notifier = Slack::Notifier.new SLACK_WEBHOOK
  end

  def ping(e)
    @notifier.ping "uncaught #{e} exception while handling connection: #{e.message}\n\nStack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
  end
end


