import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

    @Bean
    public Engine engine() {
        return new PetrolEngine();
    }

    @Bean
    public Car carConstructor() {
        return new Car(engine());
    }

    @Bean
    public Car carSetter() {
        Car car = new Car();
        car.setEngine(engine());
        return car;
    }
}
