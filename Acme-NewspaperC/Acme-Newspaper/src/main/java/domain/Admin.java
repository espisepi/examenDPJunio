
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
	private Collection<Audits>	auditsList;


	@OneToMany(mappedBy = "admin")
	@Valid
	public Collection<Audits> getAuditsList() {
		return this.auditsList;
	}

	public void setAuditsList(final Collection<Audits> auditsList) {
		this.auditsList = auditsList;
	}

}
