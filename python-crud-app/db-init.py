#!/usr/bin/env python3
import sqlite3

conn = sqlite3.connect('database.db')
print("Opened database successfully");

conn.execute('CREATE TABLE students (student_fname TEXT, student_lname TEXT, student_regnum TEXT, student_emailaddress TEXT, student_sex TEXT, student_grade TEXT)')
print("Table created successfully");
conn.close()
