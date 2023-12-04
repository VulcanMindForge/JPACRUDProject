package work.winksoft.book.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import work.winksoft.book.data.BookDAO;
import work.winksoft.book.entities.Book;

@Controller
public class BookController {

	@Autowired
	private BookDAO bookDAO;

	@RequestMapping({ "/", "home.do" })
	public String showAllBooks(Model model) {
		List<Book> books = bookDAO.getAllBooks();
		model.addAttribute("books", books);
		return "home";
	}

	@RequestMapping({ "getBook.do", "show.do" })
	public String getBookById(@RequestParam("bookId") int bookId, @RequestParam("action") String action, Model model) {
		if (bookId > 0) {
			Book book = bookDAO.findByID(bookId);
			model.addAttribute("book", book);
		}
		model.addAttribute("action", action);
		return "book/show";
	}

	@RequestMapping("addBook.do")
	public String addBook(@RequestParam(name = "bookTitle", required = false) String bookTitle,
			@RequestParam(name = "bookSynopsis", required = false) String bookSynopsis,
			@RequestParam(name = "bookReleaseDate", required = false) String dateReleased,
			@RequestParam(name = "bookSeries", required = false) Boolean series,
			@RequestParam(name = "bookNumInSeries", required = false) Integer bookNumInSeries,
			@RequestParam(name = "bookComplete", required = false) Boolean bookComplete,
			@RequestParam(name = "bookImageURL", required = false) String imageURL, Model model) {
		Book bookToAdd = new Book();
		bookToAdd.setName(bookTitle);
		bookToAdd.setSynopsis(bookSynopsis);
		SimpleDateFormat format = new SimpleDateFormat("yyy-MM-dd");
		Date parsed;
		try {
			parsed = format.parse(dateReleased);
			bookToAdd.setDateReleased(parsed);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		bookToAdd.setSeries(series);
		bookToAdd.setNumInSeries(bookNumInSeries);
		bookToAdd.setComplete(bookComplete);
		bookToAdd.setImageURL(imageURL);

		Book book = bookDAO.create(bookToAdd);
		model.addAttribute("book", book);
		return "book/show";
	}

	@RequestMapping("editBook.do")
	public String editBook(@RequestParam("bookId") Integer bookId,
			@RequestParam(name = "bookTitle", required = false) String bookTitle,
			@RequestParam(name = "bookSynopsis", required = false) String bookSynopsis,
			@RequestParam(name = "bookReleaseDate", required = false) String dateReleased,
			@RequestParam(name = "bookSeries", required = false) Boolean series,
			@RequestParam(name = "bookNumInSeries", required = false) Integer bookNumInSeries,
			@RequestParam(name = "bookComplete", required = false) Boolean bookComplete,
			@RequestParam(name = "bookImageURL", required = false) String imageURL, Model model) {
		Book editedBook = new Book();
		editedBook.setId(bookId);
		editedBook.setName(bookTitle);
		editedBook.setSynopsis(bookSynopsis);
		SimpleDateFormat format = new SimpleDateFormat("yyy-MM-dd");
		Date parsed;
		try {
			parsed = format.parse(dateReleased);
			editedBook.setDateReleased(parsed);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		editedBook.setSeries(series);
		editedBook.setNumInSeries(bookNumInSeries);
		editedBook.setComplete(bookComplete);
		editedBook.setImageURL(imageURL);

		Book book = bookDAO.update(bookId, editedBook);
		model.addAttribute("book", book);
		return "book/show";
	}

	@RequestMapping("deleteBook.do")
	public String editBook(@RequestParam("bookId") Integer bookId, Model model) {
		Boolean isDeleted = bookDAO.deleteById(bookId);
		model.addAttribute("deleted", isDeleted);
		return "book/show";
	}

}
