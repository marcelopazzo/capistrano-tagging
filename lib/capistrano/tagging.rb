namespace :tagging do
  def fetch_or_send(method)
    fetch method, respond_to?(method) ? send(method) : nil
  end

  def tag(options = {})
    fetch(:tagging_format).gsub(/:([a-z_]+[^_:])/i) do |match|
      method = $1.to_sym
      options.fetch method, fetch_or_send(method)
    end
  end

  def remote
    fetch(:tagging_remote)
  end

  def tagging_environment?
    tagging_environments = fetch(:tagging_environments).map &:to_sym
    return true if tagging_environments.nil?
    tagging_environments.include?(fetch(:stage))
  end

  def user_name
    name ||= `git config --get user.name`.chomp
  end

  def user_email
    email ||= `git config --get user.email`.chomp
  end

  def create_tag(name)
    if tagging_environment?
      run_locally { execute "git tag #{name} #{fetch(:revision)} -m \"Deployed by #{user_name} <#{user_email}>\"" }
      run_locally { execute "git push #{remote} refs/tags/#{name}:refs/tags/#{name}" }
    else
      info "ignored git tagging in #{fetch(:stage)} environment"
    end
  end

  def remove_tag(name)
    tag ||= `git tag | grep #{name}`.chomp

    if tagging_environment? && !tag.empty?
      run_locally { execute "git tag -d #{name}" }
      run_locally { execute "git push #{remote} :refs/tags/#{name}" }
    else
      if tag.empty?
        info "tag #{name} was not found"
      else
        info "ignored git tagging in #{fetch(:stage)} environment"
      end
    end
  end

  desc "Create release tag in local and remote repo"
  task :deploy do
    on roles(:app) do
      create_tag tag(:release => fetch(:release_timestamp))
    end
  end

  desc "Remove release tag from local and remote repo"
  task :cleanup do
    on roles(:app) do
      count = fetch(:keep_releases, 5).to_i
      releases = capture(:ls, '-x', releases_path).split
      releases.delete('shared')
      if count >= releases.size
        info "no old release tags to clean up"
      else
        info "keeping #{count} of #{releases.size} release tags"
        releases.first(releases.size - count).map do |release|
          remove_tag tag(:release => release)
        end
      end
    end
  end

  after  'deploy:restart', 'tagging:deploy'
  before 'deploy:cleanup', 'tagging:cleanup'
end

namespace :load do
  task :defaults do
    set :tagging_format,        ':rails_env_:release'
    set :tagging_remote,        'origin'
    # set :tagging_environments,  %w(production)
  end
end