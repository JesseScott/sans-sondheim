
//-------------------------------------
// FILTER MAIL
//-------------------------------------

 Boolean filterSubjects(String from) {
   
   String[] subscriptions = new String[2];
   subscriptions[0] = "NetBehaviour";
   subscriptions[1] = "Gmail Team <mail-noreply@google.com>";
   
   for(int i = 0; i < subscriptions.length; i++) {
      if(subscriptions[i].equals(from)) {
         return true;
      }
   }
   
   return false;
 }
