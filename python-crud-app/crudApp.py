#!/usr/bin/env python3
import sqlite3
from flask import request

from flask import Flask, render_template
app = Flask(__name__)

msg = ""

@app.route('/')
def index():
   return render_template("index.html")

@app.route('/create')
def create_record():
   return render_template("create.html")

@app.route('/addrec',methods = ['POST', 'GET'])
def addrec():
   if request.method == 'POST':
      try:
         student_fname = request.form['student_fname']
         student_lname = request.form['student_lname']
         student_regnum = request.form['student_regnum']
         student_emailaddress = request.form['student_emailaddress']
         student_sex = request.form['student_sex']
         student_grade = request.form['student_grade']
         
         with sqlite3.connect("database.db") as con:
            cur = con.cursor()
            cur.execute("INSERT INTO students (student_fname,student_lname,student_regnum,student_emailaddress,student_sex,student_grade) VALUES (?,?,?,?,?,?)",(student_fname,student_lname,student_regnum,student_emailaddress,student_sex,student_grade))
            
            con.commit()
            msg = "Record successfully added"
      except:
         con.rollback()
         msg = "error in insert operation"
      
      finally:
         return render_template("result.html",msg = msg)
         con.close()


@app.route('/delete')
def delete_record():
   return render_template("delete.html")

@app.route('/update')
def update_record():
   return render_template("update.html")

@app.route('/display')
def display_record():
   con = sqlite3.connect("database.db")
   con.row_factory = sqlite3.Row
   
   cur = con.cursor()
   cur.execute("select * from students")
   
   rows = cur.fetchall(); 
   return render_template("display.html", rows = rows)





@app.route('/welcome/<user>')
def test_params(user):
   return render_template("welcome.html", name = user)




if __name__ == '__main__':
   app.run('0.0.0.0','6700',debug = True)
