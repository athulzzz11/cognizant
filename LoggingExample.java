import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggingExample {

    static Logger logger = LoggerFactory.getLogger(LoggingExample.class);

    public static void main(String[] args) {
        processOrder(101, -50.0);
        processOrder(102, 250.0);
    }

    public static void processOrder(int orderId, double amount) {
        if (amount < 0) {
            logger.error("Order " + orderId + " failed because amount is negative: " + amount);
            return;
        }

        if (amount > 200) {
            logger.warn("Order " + orderId + " has a large amount: " + amount);
        }

        logger.info("Order " + orderId + " processed with amount " + amount);
    }
}
