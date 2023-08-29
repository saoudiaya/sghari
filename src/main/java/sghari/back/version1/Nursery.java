package sghari.back.version1;

import org.springframework.data.mongodb.core.mapping.Document;

import java.util.ArrayList;

@Document(collection = "nursery")
public class Nursery {
    private String registration_number;
    private String name;
    private int phone_number;
    private String address;
    private Position position;
    private String email;
    private int capacity;
    private String description;
    private String image;
    private String gategory;
    private int price;
    private ArrayList<Reviews> reviews;

    public Nursery(String registration_number, String name, int phone_number, String address, Position position, String email, int capacity, String description, String image, String gategory, int price, ArrayList<Reviews> reviews) {
        this.registration_number = registration_number;
        this.name = name;
        this.phone_number = phone_number;
        this.address = address;
        this.position = position;
        this.email = email;
        this.capacity = capacity;
        this.description = description;
        this.image = image;
        this.gategory = gategory;
        this.price = price;
        this.reviews = reviews;
    }

    public String getRegistration_number() {
        return registration_number;
    }

    public String getName() {
        return name;
    }

    public int getPhone_number() {
        return phone_number;
    }

    public String getAddress() {
        return address;
    }

    public Position getPosition() {
        return position;
    }

    public String getEmail() {
        return email;
    }

    public int getCapacity() {
        return capacity;
    }

    public String getDescription() {
        return description;
    }

    public String getImage() {
        return image;
    }

    public String getGategory() {
        return gategory;
    }

    public int getPrice() {
        return price;
    }

    public ArrayList<Reviews> getReviews() {
        return reviews;
    }

    public void setRegistration_number(String registration_number) {
        this.registration_number = registration_number;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhone_number(int phone_number) {
        this.phone_number = phone_number;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setGategory(String gategory) {
        this.gategory = gategory;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setReviews(ArrayList<Reviews> reviews) {
        this.reviews = reviews;
    }

    @Override
    public String toString() {
        return "Nursery{" +
                "registration_number='" + registration_number + '\'' +
                ", name='" + name + '\'' +
                ", phone_number=" + phone_number +
                ", address='" + address + '\'' +
                ", position=" + position +
                ", email='" + email + '\'' +
                ", capacity=" + capacity +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                ", gategory='" + gategory + '\'' +
                ", price=" + price +
                ", reviews=" + reviews +
                '}';
    }
}
