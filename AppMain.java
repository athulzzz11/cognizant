import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class AppMain {
    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);

        Car car1 = (Car) context.getBean("carConstructor");
        car1.drive();

        Car car2 = (Car) context.getBean("carSetter");
        car2.drive();
    }
}
