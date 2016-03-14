require 'rake/testtask'

require 'bundler'
Bundler.require

require 'yaml'  
config = YAML.load(File.read(File.expand_path('../config.yaml', __FILE__)))

namespace :db do 
  desc "Run migrations"
  task :migrate, [:version] do |t, args|
    Sequel.extension :migration
    db = Sequel.connect(config['database']['dev'])
    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(db, "db/migrations", target: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.run(db, 'db/migrations')
    end
  end

  namespace :test do 
    desc "Run migrations"
    task :migrate, [:version] do |t, args|
      Sequel.extension :migration
      db = Sequel.connect(config['database']['test'])
      if args[:version]
        puts "Migrating to version #{args[:version]}"
        Sequel::Migrator.run(db, "db/migrations", target: args[:version].to_i)
      else
        puts "Migrating to latest"
        Sequel::Migrator.run(db, 'db/migrations')
      end
    end
  end
end

Rake::TestTask.new do |t|
  t.libs = ["lib", "spec"]
  t.test_files= FileList['spec/**/*_spec.rb']
end
