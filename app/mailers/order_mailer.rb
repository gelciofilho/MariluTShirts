class OrderMailer < ApplicationMailer

  default from: 'Gelcio Filho <gelciofilho@gmail.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(place_order)
    @place_order = place_order
    mail to: place_order.email,
         subject: 'Marilu T-shirts - Your order has been confirmed!'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(place_order)
    @place_order = place_order
    mail to: place_order.email, subject: 'Marilu T-Shirts! Hi there!! We have just sent your products!'
  end

end
