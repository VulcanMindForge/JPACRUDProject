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
		String psql = "SELECT book FROM Book book WHERE id = :Id";
		List<Book> book = em.createQuery(psql, Book.class).setParameter("Id", bookId).getResultList();
		if (book.isEmpty()) {
			return null;
		} else {
			return book.get(0);
		}
	}

	@Override
	public Book create(Book book) {

		em.persist(book);
		em.flush();

		return book;
	}

	@Override
	public Book update(int bookId, Book book) {

		Book bookToUpdate = em.find(Book.class, bookId);
		bookToUpdate.setName(book.getName());
		bookToUpdate.setSynopsis(book.getSynopsis());
		bookToUpdate.setDateReleased(book.getDateReleased());
		bookToUpdate.setSeries(book.getSeries());
		bookToUpdate.setNumInSeries(book.getNumInSeries());
		bookToUpdate.setComplete(book.getComplete());
		bookToUpdate.setImageURL(book.getImageURL());

		return bookToUpdate;
	}

	@Override
	public boolean deleteById(int bookId) {
		Book bookToRemove = em.find(Book.class, bookId);
		if (bookToRemove != null) {

			em.remove(em.find(Book.class, bookId));

			return true;
		} else {
			return false;
		}
	}
}
