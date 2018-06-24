
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Audits;

@Repository
public interface AuditsRepository extends JpaRepository<Audits, Integer> {

	@Query("select (select count(n) from Newspaper n where n.auditsList.size!=0)/(count(n)*1.0) from Newspaper n")
	Double query1();

	@Query("select a from Admin a where a.auditsList.size=(select max(a.auditsList.size) from Admin a)")
	Collection<Audits> query2();

	@Query("select a from Audits a where a.admin.id=?1")
	Collection<Audits> findByAdminId(int adminId);

	@Query("select a from Audits a where a.newspaper.id=?1 and a.draftMode=false and (a.moment<=current_date or a.moment=null)")
	Collection<Audits> findByNewspaperId(int newspaperId);

}
