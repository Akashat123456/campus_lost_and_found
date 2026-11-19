SMART CAMPUS LOST & FOUND MANAGEMENT SYSTEM
===========================================

TECHNOLOGIES
- HTML, CSS, JavaScript
- PHP 8+
- MySQL / MariaDB
- XAMPP

INSTALLATION (WINDOWS + XAMPP)
1. Install and open XAMPP.
2. Start Apache and MySQL.
3. Copy the smart-campus-lost-found folder into:
   C:\xampp\htdocs\
4. Open http://localhost/phpmyadmin
5. Choose Import and select:
   smart-campus-lost-found/database/smart_campus.sql
6. Open:
   http://localhost/smart-campus-lost-found/

CREATE AN ADMIN ACCOUNT
1. Register a normal account through the website.
2. In phpMyAdmin, select smart_campus_lost_found, open the SQL tab.
3. Run this query, replacing the email with the account you registered:
   UPDATE users SET role='admin' WHERE email='admin@yourcollege.edu';
4. Log out and sign in again. The account will open the admin dashboard.

DATABASE CONFIGURATION
Default XAMPP credentials are in config/database.php:
host = localhost
database = smart_campus_lost_found
username = root
password = (blank)

FEATURES
- Student registration and login
- Password hashing and session-based role checks
- Report lost and found items
- Optional image uploads with MIME and size validation
- Browse/search/filter reports
- Submit and track ownership claims
- Admin dashboard
- Admin item status management
- Admin claim approval/rejection
- Admin student account activation/deactivation

IMPORTANT
- Use this as a local academic project and test with sample data.
- For real campus deployment, add HTTPS, email verification, rate limiting,
  audit logs, backups, stronger moderation and privacy policies.
- The admin role should only be granted by a trusted database administrator.
