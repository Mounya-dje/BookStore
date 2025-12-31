package re.spai.BookStore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InputBook {
    private Integer idBook;
    private String title;
    private Integer publicationYear;
    private String language;
    private Integer nbPage;
    private Integer idA;
    private Integer idC;
}
