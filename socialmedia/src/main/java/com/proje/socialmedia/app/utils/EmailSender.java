package com.proje.socialmedia.app.utils;

public interface EmailSender {
	boolean sendEmailToOnePerson( String reciver,String subject, String content );
}
