class Mailer < ActionMailer::Base
  def feedback(name, email, text)
  	@name = name
  	@email = email
  	@text = text
  	mail(to: "repair@inforing73.net", subject: "Обратная связь")
  end

  def call(phone)
	 	@phone = phone
	 	mail(to: "call@inforing73.net", subject: "Обратный звонок")
  end

  def order_parts(name, contacts, description,images)
    @name = name
    @contacts = contacts
    @description = description
    unless images.empty?  
      images.each do |image|
        attachments[image.image.original_filename] = File.read(image.image.path)
        image.destroy
      end
    end
    mail(to: "order@inforing73.net", subject: "Заказ на запчасть")
  end
end
