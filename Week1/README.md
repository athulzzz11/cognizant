# Week 1 - Singleton & Factory Patterns

## 1. Singleton Pattern

**Idea:** A class guarantees only one instance of itself ever exists, and gives one global way to access it.

**Files:** `Singleton/Singleton.java`, `Singleton/SingletonDemo.java`

**Run it:**
```bash
cd Singleton
javac *.java
java SingletonDemo
```

**Expected output:**
```
Singleton instance created!
Hello from the Singleton instance!
Are both references the same instance? true
```

## 2. Factory Pattern

**Idea:** Object creation is delegated to a factory class. The calling code asks for "a dog" or "a cat" by name and never has to know the concrete class being instantiated.

**Files:** `Factory/Animal.java`, `Factory/Dog.java`, `Factory/Cat.java`, `Factory/AnimalFactory.java`, `Factory/FactoryDemo.java`

**Run it:**
```bash
cd Factory
javac *.java
java FactoryDemo
```

**Expected output:**
```
Dog says: Woof!
Cat says: Meow!
```
