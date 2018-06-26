
package repositories;

import java.util.Collection;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Admin;
import domain.Troblem;

@Repository
public interface TroblemRepository extends JpaRepository<Troblem, Integer> {

	@Query("select (select count(n) from Newspaper n where n.troblemList.size!=0)/(count(n)*1.0) from Newspaper n")
	Double query1();

	@Query("select a from Admin a where a.troblemList.size=(select max(a.troblemList.size) from Admin a)")
	Collection<Admin> query2();

	@Query("select a from Troblem a where a.admin.id=?1")
	Collection<Troblem> findByAdminId(int adminId);

	@Query("select a from Troblem a where a.newspaper.id=?1 and a.draftMode=false and (a.moment<=?2 or a.moment=null)")
	Collection<Troblem> findByNewspaperId(int newspaperId, Date actual);

}
