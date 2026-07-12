public class Notifier {

    private MessageService messageService;

    public Notifier(MessageService messageService) {
        this.messageService = messageService;
    }

    public void notifyUser(String name) {
        messageService.sendMessage("Hello " + name);
    }
}
