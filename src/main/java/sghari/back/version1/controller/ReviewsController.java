package sghari.back.version1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import sghari.back.version1.Reviews;
import sghari.back.version1.services.ReviewsServices;
import java.util.List;

@RestController
@RequestMapping(value = "/reviews")
@CrossOrigin(origins = "*")
public class ReviewsController {
    @Autowired
    ReviewsServices reviewsServices;
    @GetMapping("/get")
    public List<Reviews> getReviews(){
        return reviewsServices.getReviews();
    }

    @PostMapping("/add")
    public String addReviews(@RequestBody Reviews reviews){

        return reviewsServices.addReviews(reviews);
    }
}
