package sghari.back.version1.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import sghari.back.version1.Reviews;
import sghari.back.version1.Users;

public interface ReviewsRepository extends MongoRepository<Reviews,String> {
}
