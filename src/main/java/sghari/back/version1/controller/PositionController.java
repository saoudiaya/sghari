package sghari.back.version1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import sghari.back.version1.Position;
import sghari.back.version1.Users;
import sghari.back.version1.services.PositionServices;
import sghari.back.version1.services.UsersServices;

import java.util.List;

@RestController
@RequestMapping(value = "/position")
@CrossOrigin(origins = "*")
public class PositionController {
    @Autowired
    PositionServices positionServices;
    @GetMapping("/get")
    public List<Position> getPosition(){
        return positionServices.getPosition();
    }

    @PostMapping("/add")
    public String addPosition(@RequestBody Position position){

        return positionServices.addPosition(position);
    }
}
