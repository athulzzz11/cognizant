/**
 * Singleton Pattern
 * --------------------------------
 * Guarantees that a class has exactly ONE instance for the entire
 * lifetime of the program, and provides one global access point to it.
 */
public class Singleton {

    // Holds the one and only instance. Starts as null until first requested.
    private static Singleton instance;

    // Private constructor stops other classes from doing "new Singleton()"
    private Singleton() {
        System.out.println("Singleton instance created!");
    }

    // The single access point. Creates the instance the first time it's
    // called, then simply returns the same one on every later call.
    public static Singleton getInstance() {
        if (instance == null) {
            instance = new Singleton();
        }
        return instance;
    }

    public void showMessage() {
        System.out.println("Hello from the Singleton instance!");
    }
}
