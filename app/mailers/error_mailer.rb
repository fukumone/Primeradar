class ErrorMailer < ActionMailer::Base
  default from: Primeradar::MailFrom

  def internal_server_error(exception, request)
    @exception = exception
    @request = request
    mail(to: Primeradar::DeveloperMail, subject: "[Primeradar] - Internal Server Error")
  end
end
