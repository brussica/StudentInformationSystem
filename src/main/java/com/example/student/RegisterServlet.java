package com.example.student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        StudentBean student = new StudentBean();
        student.setName(req.getParameter("name"));
        student.setReg(req.getParameter("reg"));
        student.setDept(req.getParameter("dept"));
        student.setYear(req.getParameter("year"));
        student.setEmail(req.getParameter("email"));

        synchronized (getServletContext()) {
            List<StudentBean> students =
                (List<StudentBean>) getServletContext().getAttribute("students");
            if (students == null) {
                students = Collections.synchronizedList(new ArrayList<>());
                getServletContext().setAttribute("students", students);
            }
            students.add(student);
        }

        req.setAttribute("stu", student);
        req.getRequestDispatcher("/display.jsp").forward(req, res);
    }
}
