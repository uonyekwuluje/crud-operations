package com.crudwebapp.CrudWebApplication;

public class Student {
   private String studentregnum;
   private String studentfname;
   private String studentlname;
   private String studentgrade;


   public String getStudentregnum(){
     return this.studentregnum;
   }
   public void setStudentregnum(String studentregnum){
     this.studentregnum = studentregnum;
   }

   public String getStudentfname(){
     return this.studentfname;
   }
   public void setStudentfname(String studentfname){
     this.studentfname = studentfname;
   }

   public String getStudentlname(){
     return this.studentlname;
   }
   public void setStudentlname(String studentlname){
     this.studentlname = studentlname;
   }

   public String getStudentgrade(){
     return this.studentgrade;
   }
   public void setStudentgrade(String studentgrade){
     this.studentgrade = studentgrade;
   }
}
