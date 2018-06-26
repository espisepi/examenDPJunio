
package domain;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.hibernate.validator.constraints.SafeHtml;
import org.hibernate.validator.constraints.SafeHtml.WhiteListType;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
@Table(indexes = {
	@Index(columnList = "draftMode,moment,newspaper_id,admin_id")
})
public class Troblem extends DomainEntity {

	// Attributes -------------------------------------------------------------------
	private String	ticker;
	private String	title;
	private String	description;
	private int		gauge;
	private Date	moment;
	private boolean	draftMode;


	@NotBlank
	@Pattern(regexp = "^([0-9]{2}):\\w{2}:(0[1-9]|1[012]):\\d{5}:(0[1-9]|1[0-9]|2[0-9]|3[01])")
	@Column(unique = true)
	@SafeHtml(whitelistType = WhiteListType.NONE)
	public String getTicker() {
		return this.ticker;
	}

	public void setTicker(final String ticker) {
		this.ticker = ticker;
	}

	@NotBlank
	@SafeHtml(whitelistType = WhiteListType.NONE)
	@Size(max = 100)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(final String title) {
		this.title = title;
	}

	@NotBlank
	@Size(max = 250)
	@SafeHtml(whitelistType = WhiteListType.NONE)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(final String description) {
		this.description = description;
	}

	@Range(min = 1, max = 3)
	public int getGauge() {
		return this.gauge;
	}

	public void setGauge(final int gauge) {
		this.gauge = gauge;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm")
	public Date getMoment() {
		return this.moment;
	}

	public void setMoment(final Date moment) {
		this.moment = moment;
	}

	public boolean isDraftMode() {
		return this.draftMode;
	}

	public void setDraftMode(final boolean draftMode) {
		this.draftMode = draftMode;
	}


	// Relationships---------------------------------------------------------------
	private Newspaper	newspaper;
	private Admin		admin;


	//@NotNull puede ser null cuando el troblem esta en modo borrador
	@Valid
	@ManyToOne(optional = true)
	public Newspaper getnewspaper() {
		return this.newspaper;
	}

	public void setnewspaper(final Newspaper newspaper) {
		this.newspaper = newspaper;
	}

	@NotNull
	@Valid
	@ManyToOne(optional = false)
	public Admin getAdmin() {
		return this.admin;
	}

	public void setAdmin(final Admin admin) {
		this.admin = admin;
	}

}
