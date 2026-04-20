package com.pronote.controller;

import com.pronote.database.DatabaseConnection;
import com.pronote.model.Student;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProfessorController {

    public ObservableList<Student> getStudentsByLevel(int level) {
        ObservableList<Student> list = FXCollections.observableArrayList();

        String sql =
                "SELECT s.first_name, s.last_name, s.age, s.filiere, " +
                        "       ROUND(AVG(g.grade)::numeric, 2) AS avg_grade " +
                        "FROM students s " +
                        "LEFT JOIN grades g ON g.student_id = s.id " +
                        "WHERE s.level = ? " +
                        "GROUP BY s.id, s.first_name, s.last_name, s.age, s.filiere " +
                        "ORDER BY s.last_name ASC";

        try (Connection conn = DatabaseConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, level);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(new Student(
                        rs.getString("last_name"),
                        rs.getString("first_name"),
                        String.valueOf(rs.getInt("age")),
                        rs.getString("filiere"),
                        String.format("%.2f", rs.getDouble("avg_grade"))
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Add a new grade for a student — never overwrites existing grades
    public boolean addGrade(String email, int projectId, double grade) {
        String getIdSql  = "SELECT id FROM students WHERE email = ?";
        String insertSql = "INSERT INTO grades (student_id, project_id, grade) VALUES (?, ?, ?)";

        try (Connection conn = DatabaseConnection.connect()) {

            // Get student id from email
            PreparedStatement getIdStmt = conn.prepareStatement(getIdSql);
            getIdStmt.setString(1, email);
            ResultSet rs = getIdStmt.executeQuery();

            if (!rs.next()) return false;
            int studentId = rs.getInt("id");

            // Always INSERT — never overwrite
            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setInt(1, studentId);
            insertStmt.setInt(2, projectId);
            insertStmt.setDouble(3, grade);
            insertStmt.executeUpdate();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}