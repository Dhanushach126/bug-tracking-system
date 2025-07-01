# Bug Tracking System

A professional, web-based Bug Tracking System designed for efficient management of software bugs, user roles, and expert assignments. Built using Java Servlets, JSP, MySQL, and Ant, this project is suitable for deployment in NetBeans or any compatible Java EE environment.

## Features
- Role-based authentication (Admin, Expert, User)
- Bug reporting, tracking, and status management
- Product and version management
- Expert assignment to products
- Commenting and solution tracking for bugs
- Email notifications (JavaMail integration)
- Clean, JSP-based user interface

## Project Structure
- `src/java/` — Java Servlet source code
- `web/` — JSP pages, static resources, and web configuration
- `DB/bugtrack_schema.sql` — MySQL database schema
- `nbproject/` — NetBeans project files
- `build.xml` — Ant build file

## Database Setup
1. Ensure MySQL is installed and running.
2. Execute the SQL script in `DB/bugtrack_schema.sql` to create the required database and tables:
   ```sql
   SOURCE path/to/DB/bugtrack_schema.sql;
   ```
3. (Optional) Insert an initial administrator account:
   ```sql
   INSERT INTO login (loginid, password, name, email, type) VALUES ('admin', 'admin123', 'Administrator', 'admin@example.com', 'Admin');
   ```

## Configuration
- The application expects the MySQL database at `jdbc:mysql://localhost/bugtrack` with username `root` and an empty password by default. Update the connection string in the Java source files if your environment differs.
- Ensure required JARs (`mysql-connector.jar`, `javax.mail.jar`) are present in `web/WEB-INF/lib/`.

## Building and Deployment
1. Open the project in NetBeans (recommended) or any compatible Java IDE.
2. Clean and build the project using NetBeans or by running:
   ```sh
   ant clean
   ant build
   ```
3. Deploy the generated WAR file to a servlet container (e.g., Apache Tomcat, GlassFish).
4. Access the application in your browser at `http://localhost:8080/BugTrackingSystem` (URL may vary based on your server setup).

## Dependencies
- MySQL Connector/J (JDBC driver)
- JavaMail (for email notifications)

## Notes
- The database schema includes tables for users (`login`), products, experts, bugs, and solutions/comments.
- The `author` field in the `bug` table refers to the user who reported the bug.
- Configure your servlet container and database credentials as required for your environment.

## License
This project is provided for educational and demonstration purposes. See the LICENSE file for more information.
