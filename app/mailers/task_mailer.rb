class TaskMailer < ApplicationMailer
  default from: 'taskleaf@example.com'

  def creation_email(task)
    @task = task
    mail(
      subject: 'mail: completed task',
      to: 'user@example.com',
    )
  end
end
