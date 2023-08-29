package sghari.back.version1.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import sghari.back.version1.Users;

public interface UsersRepository extends MongoRepository<Users,Integer> {
    Users findByEmailAndPassword(String email, String password);
}
