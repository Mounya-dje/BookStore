package re.spai.BookStore;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;


@Controller
public class MyController {
	private AuthorRepo arp;
	private BookRepo brp;
	private CategoryRepo crp;
	public MyController(AuthorRepo arp, BookRepo brp, CategoryRepo crp) {
		super();
		this.arp = arp;
		this.brp = brp;
		this.crp = crp;
	}
	
	@QueryMapping
	public List<Author> authors(){
		return arp.findAll();
	}
	
	@QueryMapping
	public Author author(@Argument int id) {
		return arp.findById(id)
				.orElseThrow(() -> new RuntimeException("Company not found with id = " + id));
	}
	
	@QueryMapping
	public List<Category> categories(){
		return crp.findAll();
	}
	
	@QueryMapping
	public Category category(@Argument int id) {
		return crp.findById(id)
				.orElseThrow(() -> new RuntimeException("Company not found with id = " + id));
	}
	
	//list of books
	@QueryMapping
	public ListWrapper books(
	    @Argument Integer offset,
	    @Argument Integer limit) {
	    
	    List<Book> allBooks = brp.findAll();
	    return paginateList(allBooks, offset, limit);
	}
	
	//Books of a selected author
	@QueryMapping
	public ListWrapper bookByAuthor(
	    @Argument String nameOrID,
	    @Argument Integer offset,
	    @Argument Integer limit) {
	    
	    List<Book> filteredBooks = brp.findAll().stream()
	            .filter(e -> {
	                // Check if nameOrID is a number (ID search)
	                if (nameOrID.matches("\\d+")) {
	                    return e.getAuthor().getId() == Integer.parseInt(nameOrID);
	                } else {
	                    return e.getAuthor().getName().toLowerCase()
	                           .contains(nameOrID.toLowerCase());
	                }
	            })
	            .collect(Collectors.toList());
	    
	    return paginateList(filteredBooks, offset, limit);
	}
	
	// filter books using language category or year 
	@QueryMapping
	public ListWrapper book(
	    @Argument String language,
	    @Argument String category, 
	    @Argument Integer year,
	    @Argument Integer offset,
	    @Argument Integer limit) {
	    
	    List<Book> filteredBooks = brp.findAll().stream()
	            .filter(book -> {
	                // Language filter
	                if (language != null) {
	                    String bookLanguage = book.getLanguage();
	                    if (bookLanguage == null || 
	                        !bookLanguage.toLowerCase().contains(language.toLowerCase())) {
	                        return false;
	                    }
	                }
	                
	                // Category filter
	                if (category != null) {
	                    Category bookCategory = book.getCategory();
	                    if (bookCategory == null || 
	                        !bookCategory.getNameCategory().toLowerCase().contains(category.toLowerCase())) {
	                        return false;
	                    }
	                }
	                
	                // Year filter
	                if (year != null) {
	                    Integer pubYear = book.getPublicationYear();
	                    if (pubYear == null || !pubYear.equals(year)) {
	                        return false;
	                    }
	                }
	                
	                return true;
	            })
	            .collect(Collectors.toList());
	    
	    // Use the pagination helper
	    return paginateList(filteredBooks, offset, limit);
	}
	
	@QueryMapping
	public  ListWrapper search (@Argument String keyword ,
		    @Argument Integer offset,
		    @Argument Integer limit){
		List<Book> bookResults = brp.findAll() 
		     .stream() 
		     .filter(bk-> bk.getTitle().toLowerCase()
		    		 .contains(keyword.toLowerCase()))
		    		 .collect (Collectors.toList());
		   
		     List<Author> authorResults =arp.findAll()
		    		 .stream()
		    		 .filter(a -> a.getName().toLowerCase()
		    				 .contains (keyword.toLowerCase()))
		    		 .collect (Collectors.toList());
		     
		     List<Category> categoryResults =crp.findAll()
		    		 .stream()
		    		 .filter(c -> c.getNameCategory().toLowerCase()
		    				 .contains (keyword.toLowerCase()))
		    		 .collect (Collectors.toList());
		     
		     List<Object> combinedResults = new ArrayList<>();
		     
		     combinedResults.addAll(bookResults);
		     combinedResults.addAll(authorResults);
		     combinedResults.addAll(categoryResults);
		     
		     return paginateList(combinedResults, offset, limit);
	}
	
	
	//ADD Book	
	@MutationMapping
	@PreAuthorize("hasRole('ADMIN')")
	public Book addBook(@Argument InputBook book) {
		return brp.save (Book.builder()
				.title(book.getTitle())
	            .publicationYear(book.getPublicationYear())
	            .language(book.getLanguage())
	            .nbPage(book.getNbPage())
				.author (author(book.getIdA()))
				.category (category(book.getIdC()))
				.build());
	}
	
	// Delete an author
	@MutationMapping
	@PreAuthorize("hasRole('ADMIN')")
	public boolean deleteAuthor (@Argument int id) {
		Optional<Author> a = arp.findById(id);
		if (a.isPresent()) arp.deleteById(id);
		return a.isPresent();
	}
	
	// paginated result with information on the remaining items after this page
	
	private ListWrapper paginateList(List<?> allItems, Integer offset, Integer limit) {
	    int defaultPageSize = 10;
	    int actualOffset = (offset != null && offset > 0) ? offset : 0;
	    int actualLimit = (limit != null && limit > 0) ? limit : defaultPageSize;
	    
	    int totalItems = allItems.size();  
	    
	    // Get paginated results (with +1 to check hasMore)
	    
	    List<?> paginated = allItems.stream()
	            .skip(actualOffset)  
	            .limit(actualLimit + 1)  
	            .collect(Collectors.toList());
	    
	    // Calculate hasMore
	    
	    boolean hasMore = paginated.size() > actualLimit;
	    
	    // Calculate current page
	    
	    int currentPage = actualLimit > 0 ? actualOffset / actualLimit : 0;
	    
	    // Calculate remaining items
	  
	    int itemsOnThisPage = hasMore ? actualLimit : paginated.size();
	    int remainingItems = totalItems - (actualOffset + itemsOnThisPage);
	    remainingItems = Math.max(0, remainingItems);
	    
	    // Remove extra book if hasMore
	    
	    List<?> finalList = hasMore ? 
	            paginated.subList(0, actualLimit) : paginated;
	    
	    return new ListWrapper(
	        finalList,
	        hasMore,
	        remainingItems,
	        totalItems,
	        currentPage,
	        actualLimit
	    );
	}
  
	
	
	// wapper class 
	public static class ListWrapper {
		private final List<Object> list;
		private final boolean hasMore;
		private final int remainingItems;    
		private final int totalItems;        
		private final int currentPage;       
		private final int pageSize; 
		public ListWrapper(List<?> list, boolean hasMore, int remainingItems, int totalItems, int currentPage,
				int pageSize) {
			super();
			this.list = new ArrayList<>(list); 
			this.hasMore = hasMore;
			this.remainingItems = remainingItems;
			this.totalItems = totalItems;
			this.currentPage = currentPage;
			this.pageSize = pageSize;
		}
		public List<Object> getList() {
			return list;
		}
		public boolean isHasMore() {
			return hasMore;
		}
		public int getRemainingItems() {
			return remainingItems;
		}
		public int getTotalItems() {
			return totalItems;		
		}
		public int getCurrentPage() {
			return currentPage;
		}
		public int getPageSize() {
			return pageSize;
		}
		
		
		public int getTotalPages() {
	        return pageSize > 0 ? (int) Math.ceil((double) totalItems / pageSize) : 0;
	    }

		
	}

	
}

	
	
	
	
	
	
	
	
	
	
