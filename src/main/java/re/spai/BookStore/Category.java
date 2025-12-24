package re.spai.BookStore;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
public class Category{

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idC ;
	private String  nameCategory ;


	@ManyToOne
    @JoinColumn(name = "parent_category_id")
    private Category parentCategory;
	
	@OneToMany(mappedBy = "parentCategory")
    private List<Category> subCategories;
	
	@OneToMany (mappedBy = "category")
	private List<Book> books;
}
