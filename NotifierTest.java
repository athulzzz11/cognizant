import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import static org.mockito.Mockito.verify;

public class NotifierTest {

    @Test
    void testNotifyUser() {
        MessageService mockService = Mockito.mock(MessageService.class);
        Notifier notifier = new Notifier(mockService);

        notifier.notifyUser("Alice");

        verify(mockService).sendMessage("Hello Alice");
    }
}
