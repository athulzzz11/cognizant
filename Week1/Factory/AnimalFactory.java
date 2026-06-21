/**
 * Factory Pattern
 * --------------------------------
 * Centralizes object-creation logic. Calling code asks for "a dog" or
 * "a cat" by name and never needs to know (or write) the concrete
 * class name directly.
 */
public class AnimalFactory {
    public static Animal createAnimal(String animalType) {
        switch (animalType.toLowerCase()) {
            case "dog":
                return new Dog();
            case "cat":
                return new Cat();
            default:
                throw new IllegalArgumentException("Unknown animal type: " + animalType);
        }
    }
}
