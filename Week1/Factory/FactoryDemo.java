/**
 * Demo class showing the calling code never mentions Dog or Cat directly,
 * it only talks to the AnimalFactory.
 */
public class FactoryDemo {
    public static void main(String[] args) {
        Animal dog = AnimalFactory.createAnimal("dog");
        Animal cat = AnimalFactory.createAnimal("cat");

        System.out.println("Dog says: " + dog.speak());
        System.out.println("Cat says: " + cat.speak());
    }
}
