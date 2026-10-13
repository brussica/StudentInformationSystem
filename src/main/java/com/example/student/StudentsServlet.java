package com.example.student;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/students")
public class StudentsServlet extends HttpServlet {
    @SuppressWarnings("unchecked")
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");

        List<StudentBean> students =
            (List<StudentBean>) getServletContext().getAttribute("students");
        if (students == null) students = new ArrayList<>();

        StringBuilder json = new StringBuilder("[");
        synchronized (students) {
            for (int i = 0; i < students.size(); i++) {
                StudentBean s = students.get(i);
                if (i > 0) json.append(",");
                json.append("{")
                    .append("\"name\":\"").append(escape(s.getName())).append("\",")
                    .append("\"reg\":\"").append(escape(s.getReg())).append("\",")
                    .append("\"dept\":\"").append(escape(s.getDept())).append("\",")
                    .append("\"year\":\"").append(escape(s.getYear())).append("\",")
                    .append("\"email\":\"").append(escape(s.getEmail())).append("\"")
                    .append("}");
            }
        }
        json.append("]");
        res.getWriter().write(json.toString());
    }

    private String escape(String value) {
        if (value == null) return "";
        return value.replace("\\", "\\\\")
                    .replace("\"", "\\\"")
                    .replace("\n", "\\n")
                    .replace("\r", "\\r")
                    .replace("\t", "\\t");
    }
}
