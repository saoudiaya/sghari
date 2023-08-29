package sghari.back.version1.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import sghari.back.version1.Nursery;
import sghari.back.version1.repository.NurseryRepository;

import java.util.List;

@Service
public class NurseryServices {
    @Autowired
    NurseryRepository nurseryRepository;
    public List<Nursery> getNursery(){
        return nurseryRepository.findAll();
    }

    public String addNursery(@RequestBody Nursery nursery){
        nurseryRepository.save(nursery);
        return nursery.getName()+" "+nursery.getReviews();
    }
}
