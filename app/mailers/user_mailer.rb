class UserMailer < ApplicationMailer
  default from: 'epicat.thp@gmail.com'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://epicat-thp.herokuapp.com/profile/sign_in' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def user_order(order)
    @order = order
    @user = user
    mail(to: @order.user.email, subject: 'La commande est bien passé !') 
  end

  def admin_checkorder(order)
    order = order
    mail(to: @order.admin.email, subject: 'Recapitulatif de commande') 
  end
end
