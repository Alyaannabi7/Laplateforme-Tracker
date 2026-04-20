package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnect {

    private static final String URL = "jdbc:postgresql://localhost:5432/laplateforme_tracker";
    private static final String USER = "postgres";      // ton utilisateur PostgreSQL
    private static final String PASSWORD = "1234"; // ton mot de passe

    public static Connection getConnection() throws Exception {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}


