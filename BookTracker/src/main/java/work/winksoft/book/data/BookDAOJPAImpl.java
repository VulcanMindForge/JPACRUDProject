package work.winksoft.book.data;

import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import work.winksoft.book.entities.Book;

@Transactional
@Service
public class BookDAOJPAImpl implements BookDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Book> getAllBooks() {
		String psql = "SELECT book FROM Book book";
		List<Book> books = em.createQuery(psql, Book.class).getResultList();
		return books;
	}

	@Override
	public Book findByID(int bookId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book create(Book book) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book update(int bookId, Book book) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(int bookId) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
}
