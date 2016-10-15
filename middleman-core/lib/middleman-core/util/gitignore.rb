module Middleman
  module Util
    include Contracts

    module_function

    Contract ::Middleman::Application => [String]
    def gitignore_rules(app)
      gitignore_files(app).map do |file|
        File.readlines(file)
      end.flatten.reject{|line| line.match(/^#/)}
    end

    Contract ::Middleman::Application => [String]
    def gitignore_files(app)
      [
        File.join(Dir.home, '.config', 'git', 'ignore'),
        File.join(app.root, '.git', 'info', 'exclude'),
        File.join(app.root, '.gitignore')
      ].select{|file| File.exist?(file)}
    end
  end
end

