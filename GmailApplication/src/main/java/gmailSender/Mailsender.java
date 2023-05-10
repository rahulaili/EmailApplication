package gmailSender;

import java.io.File;
import java.io.InputStream;
import java.util.Properties;

import jakarta.activation.DataHandler;
import jakarta.activation.DataSource;
import jakarta.mail.Authenticator;
import jakarta.mail.Part;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
import jakarta.mail.util.ByteArrayDataSource;

public class Mailsender {
	public boolean sendEmail(String to, String from, String subject, String text ,InputStream inputStream,String fileName) {
        boolean flag = false;

        //logic
        //smtp properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", true);
        properties.put("mail.smtp.starttls.enable", true);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.host", "smtp.gmail.com");

        String username = "Enter your mail here";
        String password = "Generate you password in your google account";


        //session
         Session session = Session.getInstance(properties, new Authenticator() {
           @Override
           protected PasswordAuthentication getPasswordAuthentication() {
        	   return new  PasswordAuthentication(username,password);
           }
        });

        try {

            MimeMessage message = new MimeMessage(session);
            message.setRecipient(jakarta.mail.Message.RecipientType.TO, new InternetAddress(to));
            message.setFrom(new InternetAddress(from));
            message.setSubject(subject);
            
            
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setText(text);
            
            messageBodyPart = new MimeBodyPart();
            DataSource source = new ByteArrayDataSource(inputStream, "application/octet-stream");
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(fileName);
            
            
//            MimeBodyPart part2 = new MimeBodyPart();
//            part2.attachFile(file);
            
            
            MimeMultipart mimemultipart = new MimeMultipart();
            
            mimemultipart.addBodyPart(messageBodyPart);
            
            message.setContent(mimemultipart);
            
            
            
            Transport.send((jakarta.mail.Message) message);
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }


        return flag;
    }

}
