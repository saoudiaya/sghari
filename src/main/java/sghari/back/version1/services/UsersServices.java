package sghari.back.version1.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import sghari.back.version1.SequenceGeneratorService;
import sghari.back.version1.Users;
import sghari.back.version1.repository.UsersRepository;

import java.util.List;

@Service
public class UsersServices {
    @Autowired
    UsersRepository usersRepository;
    @Autowired
    SequenceGeneratorService sequenceGeneratorService;

    public List<Users> getUsers(){
        return usersRepository.findAll();
    }

    public String addUsers(@RequestBody Users user){
        //set ID
        user.setId((int) sequenceGeneratorService.generateSequence((Users.SEQUENCE_NAME)));
        usersRepository.save(user);
        return user.getFirstname()+" "+user.getLastname();
    }
    public boolean login(String email, String password){
        Users user = usersRepository.findByEmailAndPassword(email, password);
        return user != null; // return true if user is found, false otherwise
    }
}



