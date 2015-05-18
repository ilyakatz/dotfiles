IRB.conf[:SAVE_HISTORY] = 200
require 'irb/ext/save-history'
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
