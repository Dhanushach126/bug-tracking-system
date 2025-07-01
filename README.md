# Bug Tracking System

A professional, web-based Bug Tracking System designed for efficient management of software bugs, user roles, and expert assignments. Built using Java Servlets, JSP, MySQL, and Ant, this project is suitable for deployment in NetBeans or any compatible Java EE environment.

## Features
- **Role-based authentication:** Supports Admin, Expert, and User roles, each with specific permissions and access levels.
- **Bug reporting and tracking:** Users can report new bugs, view their status, and track progress through various stages (e.g., Open, Assigned, Resolved).
- **Product and version management:** Administrators can manage products and their versions, ensuring bugs are reported against the correct software release.
- **Expert assignment:** Admins can assign experts to specific products, ensuring that reported bugs are handled by the right personnel.
- **Commenting and solution tracking:** Experts can provide comments and solutions for reported bugs, and users can view updates and resolutions.
- **Email notifications:** The system can send email notifications (using JavaMail) to users and experts about bug status changes or assignments.
- **User-friendly interface:** Clean, JSP-based UI for easy navigation and usability.

## Project Structure
- `src/java/` — Contains all Java source code, including servlets for handling business logic, user authentication, bug management, and database connectivity.
- `web/` — Contains JSP pages for the user interface, static resources (CSS, images), and web configuration files (`WEB-INF/web.xml`).
- `DB/bugtrack_schema.sql` — MySQL database schema script to create all necessary tables and relationships.
- `nbproject/` — NetBeans project files for IDE integration and build management.
- `build.xml` — Ant build file for compiling, building, and deploying the application.

## Database Setup
1. **Install MySQL** and ensure the server is running.
2. **Create the database and tables:**
   - Open a MySQL client (e.g., MySQL Workbench, command line).
   - Run the SQL script located at `DB/bugtrack_schema.sql`:
     ```sql
     SOURCE path/to/DB/bugtrack_schema.sql;
     ```
   - This script creates the `bugtrack` database and all required tables: `login`, `products`, `experts`, `bug`, and `solutions`.
3. **Insert initial data (optional):**
   - Add an administrator account for first-time login:
     ```sql
     INSERT INTO login (loginid, password, name, email, type) VALUES ('admin', 'admin123', 'Administrator', 'admin@example.com', 'Admin');
     ```

## Configuration
- **Database connection:**
  - The application expects the MySQL database at `jdbc:mysql://localhost/bugtrack` with username `root` and an empty password by default.
  - If your MySQL setup uses a different username, password, or host, update the connection string in the Java source files (e.g., `Login.java`, `ReportBug.java`, `SignUp.java`).
- **JAR dependencies:**
  - Ensure the following JARs are present in `web/WEB-INF/lib/`:
    - `mysql-connector.jar` (MySQL JDBC driver)
    - `javax.mail.jar` (for email notifications)
  - If you use additional features, include any other required libraries in this directory.

## Building and Deployment
1. **Open the project in NetBeans** (recommended) or any compatible Java IDE.
2. **Build the project:**
   - In NetBeans: Right-click the project and select "Clean and Build".
   - Or use Ant from the command line:
     ```sh
     ant clean
     ant build
     ```
   - This will compile the source code and package the application as a WAR file in the `dist/` directory.
3. **Deploy the application:**
   - Copy the generated WAR file to your servlet container's deployment directory (e.g., `webapps` in Apache Tomcat).
   - Alternatively, deploy directly from NetBeans if your server is configured.
4. **Access the application:**
   - Open your browser and navigate to `http://localhost:8080/BugTrackingSystem` (the URL may vary depending on your server and context path).

## Dependencies
- **MySQL Connector/J:** JDBC driver for connecting Java applications to MySQL databases.
- **JavaMail:** Library for sending email notifications from the application.
- **Servlet Container:** Apache Tomcat, GlassFish, or any Java EE-compatible server.
- **JDK 1.8 or higher:** Required for compiling and running the application.

## Notes
- The database schema includes tables for users (`login`), products, experts, bugs, and solutions/comments.
- The `author` field in the `bug` table refers to the user who reported the bug.
- All foreign key relationships are enforced to maintain data integrity.
- You may customize the UI and extend features as needed for your organization.
- For troubleshooting, check server logs and ensure all dependencies are correctly configured.

## License
This project is provided for educational and demonstration purposes. See the LICENSE file for more information.
