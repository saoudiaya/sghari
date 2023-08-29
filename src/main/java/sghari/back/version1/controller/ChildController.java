package sghari.back.version1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import sghari.back.version1.Child;
import sghari.back.version1.repository.ChildRepository;
import sghari.back.version1.services.ChildServices;

import javax.imageio.ImageIO;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping(value = "/child")
@CrossOrigin(origins = "*")
public class ChildController {
    private ChildServices childServices;
    private ChildRepository childRepository;

    @Autowired
    public ChildController(ChildServices childServices, ChildRepository childRepository) {
        this.childServices = childServices;
        this.childRepository = childRepository;
    }

    @GetMapping("/get")
    public List<Child> getChild() {
        return childServices.getChild();
    }


    @PostMapping("/add")
    public Child addChild(@RequestParam("image") MultipartFile file,
                          @RequestParam("firstname") String firstname,
                          @RequestParam("lastname") String lastname,
                          @RequestParam("birthday") @DateTimeFormat(pattern = "yyyy/MM/dd") Date birthday,
                          @RequestParam("gender") String gender,
                          @RequestParam("sickness") String sickness,
                          @RequestParam("registration_fees") int registration_fees ,
                          @RequestParam("name_nursery") String name_nursery

    ) throws IOException {

        if (!isImageValid(file)) {
            throw new IOException("Invalid image data");
        }

        byte[] imageBytes = file.getBytes();
        Date registration_date = new Date(); // current date
        Child child = new Child(firstname, lastname, birthday, imageBytes, gender, sickness, registration_date, registration_fees, name_nursery); // registration fees and nursery name are set to 0 here
        return childRepository.save(child);
    }
    private boolean isImageValid(MultipartFile file) {
        try {
            ImageIO.read(new ByteArrayInputStream(file.getBytes()));
            return true;
        } catch (IOException e) {
            return false;
        }


    }

}