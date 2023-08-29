package sghari.back.version1.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import sghari.back.version1.Position;

public interface PositionRepository extends MongoRepository<Position,String> {

}
