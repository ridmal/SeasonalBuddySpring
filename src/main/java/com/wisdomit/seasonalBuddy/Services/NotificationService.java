package com.wisdomit.seasonalBuddy.Services;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;






import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wisdomit.seasonalBuddy.models.User;

@Service
public class NotificationService {


private JavaMailSender javaMailSender;
	
	@Autowired
	public NotificationService(JavaMailSender javaMailSender){
		this.javaMailSender = javaMailSender;
	}
	
	@Async
	public void sendNotificaitoin(User user,String path,String msg,String season) throws MailException, InterruptedException, MessagingException {
        System.out.println("Sending email...");
        MimeMessage mail = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mail,true);
        FileSystemResource file = new FileSystemResource("src/main/resources/public/SendingCards/"+path);
		helper.addAttachment(file.getFilename(), file);
helper.setTo(user.getEmail());
helper.setFrom("ridmadushanka@gmail.com");
helper.setSubject("Happy "+season);
helper.setText(msg);
        //SimpleMailMessage mail = new SimpleMailMessage();
//        SimpleMailMessage mail = new SimpleMailMessage();
//		mail.setTo(user.getEmailAddress());
//		mail.setFrom("ridmadushanka@gmail.com");
//		mail.setSubject("Spring Boot is awesome!");
//		mail.setText("Why aren't you using Spring Boot?");
		
		javaMailSender.send(mail);
		
		System.out.println("Email Sent!");
	}
	
	
}
