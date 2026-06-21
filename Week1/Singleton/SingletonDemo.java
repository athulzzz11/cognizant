/**
 * Demo class that proves the Singleton pattern works:
 * two separate calls to getInstance() return the SAME object.
 */
public class SingletonDemo {
    public static void main(String[] args) {
        Singleton first = Singleton.getInstance();
        Singleton second = Singleton.getInstance();

        first.showMessage();

        // true means both variables point to the exact same object in memory
        System.out.println("Are both references the same instance? " + (first == second));
    }
}
