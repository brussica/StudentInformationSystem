# Student Information System (Servlet + JSP + JavaBean + AJAX)

## Requirements
- JDK 17
- Maven 3.9+
- Apache Tomcat 10.1 for local deployment

This project uses `jakarta.servlet`, so use Tomcat 10.1 (not Tomcat 9).

## Run locally
1. Open this folder in VS Code.
2. In the terminal, run:
   ```powershell
   mvn clean package
   ```
3. Copy `target/StudentInformationSystem.war` into your Tomcat 10.1 `webapps` folder.
4. Start Tomcat using `bin\startup.bat`.
5. Open `http://localhost:8080/StudentInformationSystem/` in your browser.
   If you deploy the WAR as `ROOT.war`, the URL is `http://localhost:8080/`.

## Features
- Servlet receives the form POST and stores the student in the application context.
- JavaBean represents a student.
- JSP displays the submitted student details.
- AJAX calls `/students` and shows the students registered in this running server.

## Important storage note
This sample keeps students in memory. Data can be lost when the server restarts or the service sleeps/redeploys. For long-term records, connect a database before using it for real student data.

## Public hosting
The included Dockerfile builds the WAR and runs it in Tomcat. You can push this project to a Git repository and create a Docker-based web service with a hosting provider that supports Docker. After a successful deployment, use the public URL shown in that provider's dashboard. Do not send the localhost URL to your instructor.
