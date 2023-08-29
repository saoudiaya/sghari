package sghari.back.version1.services;

import java.io.IOException;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mongodb.client.gridfs.GridFSBucket;

import sghari.back.version1.Child;
import sghari.back.version1.repository.ChildRepository;

@Service
public class ChildServices {

    @Autowired
    private ChildRepository childRepository;

    public List<Child> getChild() {
        return childRepository.findAll();
    }


}
