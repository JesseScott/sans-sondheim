
//-------------------------------------
// MAIL
//-------------------------------------

void checkMail() {
  try {
    Properties props = System.getProperties();

    props.put("mail.pop3.host", "pop.gmail.com");
    
    // These are security settings required for gmail
    // May need different code depending on the account
    props.put("mail.pop3.port", "995");
    props.put("mail.pop3.starttls.enable", "true");
    props.setProperty("mail.pop3.socketFactory.fallback", "false");
    props.setProperty("mail.pop3.socketFactory.class","javax.net.ssl.SSLSocketFactory");

    // Create authentication object
    Auth auth = new Auth();
    
    // Make a session
    Session session = Session.getDefaultInstance(props, auth);
    Store store = session.getStore("pop3");
    store.connect();
    
    // Get inbox
    Folder folder = store.getFolder("INBOX");
    folder.open(Folder.READ_ONLY);
    System.out.println(folder.getMessageCount() + " total messages.");
    
    // Get array of messages and display them
    Message message[] = folder.getMessages();
    for (int i=0; i < message.length; i++) {
      System.out.println("---------------------");
      System.out.println("Message # " + (i+1));
      System.out.println("From: " + message[i].getFrom()[0]);
      System.out.println("Subject: " + message[i].getSubject());
      System.out.println("Message:");
      String content = message[i].getContent().toString(); 
      System.out.println(content);
    }
    
    // Close the session
    folder.close(false);
    store.close();
  } 
  // This error handling isn't very good
  catch (Exception e) {
    e.printStackTrace();
  }
}



