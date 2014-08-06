require_relative '../lib/github'

SCHEDULER.every '10s' do
  status = Github::Status.new

  send_event 'github_status', { text: status.status, moreinfo: status.message }

  status.terminate
end
