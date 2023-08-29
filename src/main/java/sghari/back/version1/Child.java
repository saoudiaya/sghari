package sghari.back.version1;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Date;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import javax.imageio.ImageIO;

@Document(collection = "child")
public class Child {

    @Id
    private String id;
    private String firstname;
    private String lastname;
    private Date birthday;
    private byte[] image;
    private String gender;
    private String sickness;
    private Date registration_date;
    private int registration_fees;
    private String name_nursery;

    public Child(String firstname, String lastname, Date birthday, byte[] image, String gender, String sickness, Date registration_date, int registration_fees, String name_nursery) {

        this.firstname = firstname;
        this.lastname = lastname;
        this.birthday = birthday;
        this.image = image;
        this.gender = gender;
        this.sickness = sickness;
        this.registration_date = registration_date;
        this.registration_fees = registration_fees;
        this.name_nursery = name_nursery;
    }

    public String getName_nursery() {
        return name_nursery;
    }

    public void setName_nursery(String name_nursery) {
        this.name_nursery = name_nursery;
    }

    public void setRegistration_date(Date registration_date) {
        this.registration_date = registration_date;
    }

    public void setRegistration_fees(int registration_fees) {
        this.registration_fees = registration_fees;
    }


    public Date getRegistration_date() {
        return registration_date;
    }

    public int getRegistration_fees() {
        return registration_fees;
    }

    public String getImageBase64() {
        return Base64.getEncoder().encodeToString(this.image);
    }

    // getters and setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSickness() {
        return sickness;
    }

    public void setSickness(String sickness) {
        this.sickness = sickness;
    }
    public boolean checkImageData(byte[] imageData) {
        try {
            BufferedImage image = ImageIO.read(new ByteArrayInputStream(imageData));
            return (image != null);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }


}
