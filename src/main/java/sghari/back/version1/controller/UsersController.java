package sghari.back.version1.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import sghari.back.version1.SequenceGeneratorService;
import sghari.back.version1.Users;
import sghari.back.version1.repository.UsersRepository;
import sghari.back.version1.services.UsersServices;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/users")
@CrossOrigin(origins = "*")
public class UsersController {
    @Autowired
    UsersServices usersServices;

    @GetMapping("/get")
    public List<Users> getUsers(){
        return usersServices.getUsers();
    }

    @PostMapping(value = "/login", consumes = MediaType.APPLICATION_JSON_VALUE)
    public Boolean login(@RequestBody Map<String, String> body) {
        String email = body.get("email");
        String password = body.get("password");
        return usersServices.login(email, password);
    }


    @PostMapping ("/add")
    public String addUsers(@RequestBody Users users){
        return usersServices.addUsers(users);
    }

}
