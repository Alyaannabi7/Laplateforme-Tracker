package com.pronote.controller;

import com.pronote.database.DatabaseConnect;
import com.pronote.model.Student;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import java.sql.*;

public class ProfessorController {

    public ObservableList<Student> getStudentsByLevel(int professorId) {
        ObservableList<Student> list = FXCollections.observableArrayList();
        String sql = "SELECT first_name, last_name, age, grade FROM public.student WHERE professor_id = ?";
        try (Connection conn = DatabaseConnect.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, professorId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Student(
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    String.valueOf(rs.getInt("age")),
                    "-",
                    String.valueOf(rs.getDouble("grade"))
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}