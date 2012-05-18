#schedule job
desc "Remove queries older than a month"
task :remove_old_queries => :environment do
  Query.delete_all ["created_at < ?", 1.month.ago]
end