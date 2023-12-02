package work.winksoft.book.data;

import java.util.List;

import work.winksoft.book.entities.Book;

public interface BookDAO {
	Book findByID(int bookId);
	List<Book> getAllBooks();
	Book create(Book book);
	Book update(int bookId, Book book);
	boolean deleteById(int bookId);
	
	
}
