package re.spai.BookStore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class InputBook {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idBook ;
	private String title;
	private  int publicationYear;
	private String language ;
	private int nbPage ;
	private int idA ;
	private int idC ;
}
