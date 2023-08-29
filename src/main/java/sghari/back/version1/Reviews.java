package sghari.back.version1;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;


@Getter
@Setter
@ToString
@Document(collection = "reviews")
public class Reviews {
    private String image;
    private String name;
    private Date date;
    private String comment;
    private double rating;

    public String getImage() {
        return image;
    }

    public String getName() {
        return name;
    }

    public Date getDate() {
        return date;
    }

    public String getComment() {
        return comment;
    }

    public double getRating() {
        return rating;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Reviews{" +
                "image='" + image + '\'' +
                ", name='" + name + '\'' +
                ", date='" + date + '\'' +
                ", comment='" + comment + '\'' +
                ", rating=" + rating +
                '}';
    }
}
