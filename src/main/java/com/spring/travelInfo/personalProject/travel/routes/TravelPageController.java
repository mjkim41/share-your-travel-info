package com.spring.travelInfo.personalProject.travel.routes;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/travel")
public class TravelPageController {

    // 메인 페이지
    @GetMapping("")
    public String getMainPage() {
        return "/travel/main";
    }

    @GetMapping("/flight")
    public String getFlightInfo() {
        return "/travel/flight";
    }

    @GetMapping("/activities")
    public String getActivitiesInfo() {
        return "/travel/activities";
    }


}
