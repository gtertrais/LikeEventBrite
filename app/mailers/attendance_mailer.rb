class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def attendance_email(ticket)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @ticket = ticket
    @user = User.find(@ticket.user_id)
    @event = Event.find(@ticket.event_id)
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/event/id' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Attendance Event') 
  end


end
