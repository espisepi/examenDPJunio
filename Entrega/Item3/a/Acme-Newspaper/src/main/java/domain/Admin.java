
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.Valid;

@Entity
@Access(AccessType.PROPERTY)
public class Admin extends Actor {

	// Relationships ---------------------------------------------------------------
	private Collection<Troblem>	troblemList;


	@OneToMany(mappedBy = "admin")
	@Valid
	public Collection<Troblem> getTroblemList() {
		return this.troblemList;
	}

	public void setTroblemList(final Collection<Troblem> troblemList) {
		this.troblemList = troblemList;
	}

}
