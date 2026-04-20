package com.pronote.controller;

import com.pronote.database.DatabaseConnect;
import java.sql.*;

public class LoginController {

    public String login(String email, String password) {
        String sql = "SELECT 'admin' AS role FROM public.admin WHERE email=? AND password=? " +
                    "UNION " +
                    "SELECT 'prof' FROM public.professor WHERE email=? AND password=? " +
                    "UNION " +
                    "SELECT 'student' FROM public.student WHERE email=? AND password=?";
        try (Connection conn = DatabaseConnect.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);  ps.setString(2, password);
            ps.setString(3, email);  ps.setString(4, password);
            ps.setString(5, email);  ps.setString(6, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getString("role");
            return "invalid";

        } catch