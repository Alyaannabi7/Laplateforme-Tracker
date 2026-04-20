
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
import controller.StudentManager;
import model.Student;

class StudentManagerTest {



    @Test
    void testAverageGrade() {
        StudentManager manager = new StudentManager();
        manager.addStudent(new Student(1,"A","B",20,10,"Math"));
        manager.addStudent(new Student(2,"C","D",22,20,"Math"));
        assertEquals(15.0, manager.averageGrade());
    }

    @Test
    void testAverageAge() {
        StudentManager manager = new StudentManager();
        manager.addStudent(new Student(1,"A","B",20,10,"Math"));
        manager.addStudent(new Student(2,"pipi","caca",22,20,"Math"));
        assertEquals(21.0, manager.averageAge());
    }
}