
//-------------------------------------
// CHECK MAIL
//-------------------------------------

void checkMail() {
  try {
    Properties props = System.getProperties();
    props.put("mail.pop3.host", "pop.gmail.com");
    
    // Security settings required for gmail
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
    println("There Are " + folder.getMessageCount() + " Total Messages \n");
    
    // Get array of messages and display them
    Message message[] = folder.getMessages();
    
    for (int i = 0; i < message.length; i++) {
      println("---------------------");
      Address address = message[i].getFrom()[0];
      String from = address.toString();
      
      println("Message # " + (i+1));
      println("From: " + from);
      
      if( filterSubjects(from)) {
        String subject = message[i].getSubject();
        println("Subject: " + subject);
        String content = message[i].getContent().toString(); 
        println("Content: \n" + content);
      }
      println("\n\n");
    }
    
    // Close the session
    folder.close(false);
    store.close();
  } 
  catch (Exception e) {
    e.printStackTrace();
  }
}



