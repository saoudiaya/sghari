package sghari.back.version1.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import sghari.back.version1.Nursery;

public interface NurseryRepository extends MongoRepository<Nursery,String> {
}
