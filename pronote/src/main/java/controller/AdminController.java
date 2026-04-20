package com.pronote.controller;

import com.pronote.database.DatabaseConnect;
import java.sql.*;

public class AdminController {

    public boolean addProfessor(String fn, String ln, String email, String pw, String subject) {
        return execute(
            "INSERT INTO public.professor (first_name, last_name, email, subject) VALUES (?,?,?,?)",
            fn, ln, email, subject
        );
    }

    public boolean deleteProfessor(String email) {
        return execute("DELETE FROM public.professor WHERE email=?", email);
    }

    public boolean addStudent(String fn, String ln, String email, String pw, String filiere) {
        return execute(
            "INSERT INTO public.student (first_name, last_name, age, grade) VALUES (?,?,0,0)",
            fn, ln
        );
    }

    public boolean deleteStudent(String email) {
        // la table student n'a pas d'email — on supprime par prénom+nom ici
        return execute("DELETE FROM public.student WHERE first_name=?", email);
    }

    private boolean execute(String sql, String... params) {
        try (Connection conn = DatabaseConnect.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            for (int i = 0; i < params.length; i++)
                ps.setString(i + 1, params[i]);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}