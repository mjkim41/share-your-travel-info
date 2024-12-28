package com.spring.travelInfo.routes;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/travel")
public class TravelPageController {

    // 메인 페이지
    @GetMapping
    public String getMainPage() {
        return "/main";
    }

    @GetMapping("/flight")
    public String getFlightInfo() {
        return "/flight";
    }

    @GetMapping("/todo")
    public String getActivitiesInfo() {
        return "/todoList";
    }


}
