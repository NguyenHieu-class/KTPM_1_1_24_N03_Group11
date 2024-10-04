package com.project.CarRental2.api;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.project.CarRental2.model.Insurance;
import com.project.CarRental2.model.User;
import com.project.CarRental2.service.InsuranceService;
import com.project.CarRental2.service.UploadFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/insurance")
public class InsuranceAPI {

    @Autowired
    private InsuranceService insuranceService;

    @Autowired
    private UploadFile uploadFile;

    @GetMapping("")
    public List<Insurance> showAll() {
        return insuranceService.getAllInsurance();
    }

}
