package sghari.back.version1;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.stereotype.Component;

@Document(collection = "database_sequences")
@Component
public class DataBaseSequence {
        @Id
        private String id;

        private long seq;

        public DataBaseSequence() {}

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public long getSeq() {
            return seq;
        }

        public void setSeq(long seq) {
            this.seq = seq;
        }
}
