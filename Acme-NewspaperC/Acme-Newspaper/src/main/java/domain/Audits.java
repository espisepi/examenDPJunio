
package domain;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.hibernate.validator.constraints.SafeHtml;
import org.hibernate.validator.constraints.SafeHtml.WhiteListType;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
//@Table(indexes = {
//	@Index(columnList = "moment,newspaper_id,admin_id")
//})
public class Audits extends DomainEntity {

	// Attributes -------------------------------------------------------------------
	private String	ticker;
	private String	title;
	private String	description;
	private int		gauge;
	private Date	moment;
	private boolean	draftMode;


	@NotBlank
	//@Pattern()
	@SafeHtml(whitelistType = WhiteListType.NONE)
	public String getTicker() {
		return this.ticker;
	}

	public void setTicker(final String ticker) {
		this.ticker = ticker;
	}

	@NotBlank
	@SafeHtml(whitelistType = WhiteListType.NONE)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(final String title) {
		this.title = title;
	}

	@NotBlank
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


	//@NotNul puede ser null cuando el audits esta en modo borrador
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
