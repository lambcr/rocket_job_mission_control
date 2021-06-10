module RocketjobMissionControl
  class AccessPolicy
    include AccessGranted::Policy

    def configure
      # Destroy Jobs, Dirmon Entries
      role :admin, {admin: true} do
        can %i[create destroy], RocketJob::Job
        can :destroy, RocketJob::DirmonEntry
      end

      # View the contents of jobs and edit the data within them.
      # Including encrypted records.
      role :editor, {editor: true} do
        can %i[view_slice edit_slice update_slice], RocketJob::Job
      end

      # Stop, Pause, Resume, Destroy (force stop) Rocket Job Servers
      role :operator, {operator: true} do
        can %i[stop kill pause resume destroy destroy_zombies thread_dump], RocketJob::Server
      end

      # Pause, Resume, Retry, Abort, Edit Jobs
      role :manager, {manager: true} do
        can %i[edit pause resume retry abort fail update run_now], RocketJob::Job
      end

      # Create, Destroy, Enable, Disable, Edit, Copy, Replicate Dirmon Entries
      role :dirmon, {dirmon: true} do
        can %i[create enable disable update edit copy replicate], RocketJob::DirmonEntry
      end

      # A User can only edit their own jobs
      role :user, {user: true} do
        can %i[edit pause resume retry abort update], RocketJob::Job do |job, auth|
          job.respond_to?(:login) && (job.login == auth.login)
        end
      end

      # Read only access
      role :view do
        can :read, RocketJob::Job
        can :read, RocketJob::DirmonEntry
        can :read, RocketJob::Server
        can :read, RocketJob::Worker
      end
    end
  end
end
