class ApplicationMailer < ActionMailer::Base
  #Dummy email params
  default to: "conor@courseworkapp.com", from: 'conor@courseworkapp.com'
  layout 'mailer'
end
