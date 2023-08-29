package sghari.back.version1.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import sghari.back.version1.Child;
import sghari.back.version1.Nursery;

import java.util.Optional;

public interface ChildRepository extends MongoRepository<Child,Integer> {
}
