package sghari.back.version1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import sghari.back.version1.Nursery;
import sghari.back.version1.services.NurseryServices;

import java.util.List;

@RestController
@RequestMapping(value = "/nursery")
@CrossOrigin(origins = "*")
public class NurseryController {
    @Autowired
    NurseryServices nurseryServices;

    @GetMapping("/get")
    public List<Nursery> getNursery(){
        return nurseryServices.getNursery();
    }

    @PostMapping("/add")
    public String addNursery(@RequestBody Nursery nursery){

        return nurseryServices.addNursery(nursery);
    }
}
