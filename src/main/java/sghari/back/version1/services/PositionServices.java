package sghari.back.version1.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import sghari.back.version1.Position;
import sghari.back.version1.Users;
import sghari.back.version1.repository.PositionRepository;
import sghari.back.version1.repository.UsersRepository;

import java.util.List;

@Service
public class PositionServices {
    @Autowired
    PositionRepository positionRepository;

    public List<Position> getPosition(){
        return positionRepository.findAll();
    }

    public String addPosition(@RequestBody Position position){
        positionRepository.save(position);
        return position.getLatitude()+" "+position.getLongitude();
    }

}
