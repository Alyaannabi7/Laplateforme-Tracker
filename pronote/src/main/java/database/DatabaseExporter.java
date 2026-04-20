import java.io.*;
import java.sql.*;

public class DatabaseExporter {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/laplateforme_tracker";
        String user = "postgres";
        String password = "1234";
        String outputFile = "backup.sql";

        try (Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();
            PrintWriter writer = new PrintWriter(new FileWriter(outputFile))) {

            ResultSet tables = stmt.executeQuery("SHOW TABLES");
            while (tables.next()) {
                String table = tables.getString(1);
                writer.println("-- Dumping data for table: " + table);

                ResultSet rs = stmt.executeQuery("SELECT * FROM " + table);
                ResultSetMetaData meta = rs.getMetaData();
                int columnCount = meta.getColumnCount();

                while (rs.next()) {
                    StringBuilder sb = new StringBuilder("INSERT INTO " + table + " VALUES(");
                    for (int i = 1; i <= columnCount; i++) {
                        Object value = rs.getObject(i);
                        sb.append(value == null ? "NULL" : "'" + value.toString().replace("'", "''") + "'");
                        if (i < columnCount) sb.append(", ");
                    }
                    sb.append(");");
                    writer.println(sb.toString());
                }
                writer.println();
            }

            System.out.println("Database exported to " + outputFile);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}





