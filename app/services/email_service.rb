class EmailService
  def self.send_email(to, subject, body)
    message = <<~MESSAGE
      From:oumaymakahouli20@gmail.com
      To: #{to}
      Subject: #{subject}

      #{body}
    MESSAGE

    smtp = Net::SMTP.new('smtp.gmail.com', 587)
    smtp.enable_starttls
    smtp.start('gmail.com', 'oumaymakahouli20@gmail.com', 'thgh ffsc ptkw aobt', :login) do |smtp|
      smtp.send_message(message, 'oumaymakahouli20@gmail.com', to)
    end
  end
end
