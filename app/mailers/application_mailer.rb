class ApplicationMailer < ActionMailer::Base
  default to: "conor@courseworkapp.com", from: 'conor@courseworkapp.com'
  layout 'mailer'
end
