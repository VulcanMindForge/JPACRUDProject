package work.winksoft.book.entities;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String synopsis;
	@Column(name = "date_released")
	private Date dateReleased;
	@Column(name = "is_series")
	private Boolean series;
	@Column(name = "number_in_series")
	private Integer numInSeries;
	@Column(name = "series_complete")
	private Boolean complete;
	@Column(name = "image_url")
	private String imageURL;
	
	public Book () {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSynopsis() {
		return synopsis;
	}

	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}

	public Date getDateReleased() {
		return dateReleased;
	}

	public void setDateReleased(Date parsed) {
		this.dateReleased = parsed;
	}

	public Boolean getSeries() {
		return series;
	}

	public void setSeries(Boolean series) {
		this.series = series;
	}

	public Integer getNumInSeries() {
		return numInSeries;
	}

	public void setNumInSeries(Integer numInSeries) {
		this.numInSeries = numInSeries;
	}

	public Boolean getComplete() {
		return complete;
	}

	public void setComplete(Boolean complete) {
		this.complete = complete;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Book other = (Book) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Book [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", synopsis=");
		builder.append(synopsis);
		builder.append(", dateReleased=");
		builder.append(dateReleased);
		builder.append(", series=");
		builder.append(series);
		builder.append(", numInSeries=");
		builder.append(numInSeries);
		builder.append(", complete=");
		builder.append(complete);
		builder.append(", imageURL=");
		builder.append(imageURL);
		builder.append("]");
		return builder.toString();
	}

	
}
