package sghari.back.version1.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import sghari.back.version1.Reviews;
import sghari.back.version1.repository.ReviewsRepository;


import java.util.List;

@Service
public class ReviewsServices {
    @Autowired
    ReviewsRepository reviewsRepository;

    public List<Reviews> getReviews(){
        return reviewsRepository.findAll();
    }

    public String addReviews(@RequestBody Reviews reviews){
        reviewsRepository.save(reviews);
        return reviews.getName();
    }
}
