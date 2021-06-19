package com.proje.socialmedia.app.utils;


import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSenderImpl implements EmailSender{

	@Override
	public boolean sendEmailToOnePerson(String reciver, String subject, String content) {
		// TODO Auto-generated method stub
		
		Properties props = new Properties();
		   props.put("mail.smtp.auth", "true");
		   props.put("mail.smtp.starttls.enable", "true");
		   props.put("mail.smtp.host", "smtp.gmail.com");
		   props.put("mail.smtp.port", "587");
		
		   try {
			   Session session = Session.getInstance(props, new javax.mail.Authenticator() {
				      protected PasswordAuthentication getPasswordAuthentication() {
				         return new PasswordAuthentication("miracpy10@gmail.com", "JavaMiracPy10!");
				      }
				   });
		   Message msg = new MimeMessage(session);
		   msg.setFrom(new InternetAddress("miracpy10@gmail.com",false));
		   
		   
		   msg.setRecipients(Message.RecipientType.TO,InternetAddress.parse(reciver));
		   msg.setSubject(subject);
		   msg.setContent(content,"text/html;charset=utf-8");
		   msg.setSentDate(new Date());
		  
		   Transport.send(msg);
		   
		   System.out.println("gonderdi");
		   return true;
		   
		   }catch (MessagingException e) {
			// TODO: handle exception
			   System.out.println("HATA İLE KARŞILAŞILDI "+e.getMessage());
			   return false;
		   }
	}

}
