package com.crudwebapp.CrudWebApplication;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class CrudWebApplicationController {

        @GetMapping("/create")
        public String showForm(Model model) {
            model.addAttribute("student", new Student());
            return "create";
        }

        @PostMapping("/update-data")
        public String formSubmit(@ModelAttribute Student student, Model model) {
            model.addAttribute("student", student); 
            return "result";
        }
}
