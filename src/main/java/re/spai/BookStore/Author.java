package re.spai.BookStore;


import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Author {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id ;
	private String  name ;
	private int age ;
	private String nationality ;
	
	@OneToMany (mappedBy = "author")
	private List<Book> books;
}
