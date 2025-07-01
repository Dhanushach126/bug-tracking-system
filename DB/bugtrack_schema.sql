CREATE DATABASE IF NOT EXISTS bugtrack;
USE bugtrack;

-- User login table
CREATE TABLE login (
    loginid VARCHAR(50) PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    type VARCHAR(20) NOT NULL -- 'Admin', 'Expert', 'User'
);

-- Products table
CREATE TABLE products (
    prodid INT AUTO_INCREMENT PRIMARY KEY,
    prodname VARCHAR(100) NOT NULL,
    version VARCHAR(50) NOT NULL
);

-- Experts table (which expert is assigned to which product)
CREATE TABLE experts (
    expertid VARCHAR(50), -- references login.loginid
    prodid INT,           -- references products.prodid
    PRIMARY KEY (expertid, prodid),
    FOREIGN KEY (expertid) REFERENCES login(loginid),
    FOREIGN KEY (prodid) REFERENCES products(prodid)
);

-- Bug reports table
CREATE TABLE bug (
    bugid INT AUTO_INCREMENT PRIMARY KEY,
    prodid INT,
    prodname VARCHAR(100),
    version VARCHAR(50),
    env VARCHAR(50),
    type VARCHAR(50),
    description TEXT,
    priority VARCHAR(20),
    status VARCHAR(20),
    authorid VARCHAR(50),
    author VARCHAR(100),
    assign_to VARCHAR(50),
    synopsis VARCHAR(255),
    FOREIGN KEY (prodid) REFERENCES products(prodid),
    FOREIGN KEY (authorid) REFERENCES login(loginid),
    FOREIGN KEY (assign_to) REFERENCES login(loginid)
);

-- Solutions/comments table
CREATE TABLE solutions (
    bugid INT,
    expertid VARCHAR(50),
    expert VARCHAR(100),
    soln TEXT,
    date DATE,
    FOREIGN KEY (bugid) REFERENCES bug(bugid),
    FOREIGN KEY (expertid) REFERENCES login(loginid)
);
