
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Admin;
import domain.Newspaper;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Integer> {

	@Query("select a from Admin a where a.userAccount.id = ?1")
	Admin findByUserAccountId(int id);

	//C1: The average and the standard deviation of newspapers created per user.
	@Query("select avg(u.newspapers.size), stddev(u.newspapers.size) from User u")
	Double[] theAvgAndStddevOfNewspapersForUser();

	//C2: The average and the standard deviation of articles written by writer.
	@Query("select avg(n.articles.size),stddev(n.articles.size) from User n")
	Double[] theAvgAndStddevOfArticlesPerWriter();

	//C3: The average and the standard deviation of articles per newspaper.
	@Query("select avg(n.articles.size),stddev(n.articles.size) from Newspaper n")
	Double[] theAvgAndStddevOfArticlePerNewspaper();

	//C4: The newspapers that have at least 10% more articles than the average.
	@Query("select n from Newspaper n where n.articles.size>(select 1.10 * avg(n.articles.size) from Newspaper n)")
	Collection<Newspaper> newspaperHaveLeast10MorePercentFewerArtclesThanAverage();

	//C5: The newspapers that have at least 10% fewer articles than the average.
	@Query("select n from Newspaper n where n.articles.size<(select 0.90 * avg(n.articles.size) from Newspaper n)")
	Collection<Newspaper> newspaperHaveLeast10LeastPercentFewerArtclesThanAverage();

	//C6: The ratio of users who have ever created a newspaper.
	@Query("select count(u)*1.0/(select count(us) from User us) from User u where u.newspapers.size!=0)")
	Double theRatioOfUsersWritingNewspaper();

	//C7: The ratio of users who have ever written an article.
	@Query("select count(u)*1.0/(select count(us) from User us) from User u where u.articles.size!=0)")
	Double theRatioOfUsersWritingArticle();

	//Acme-Newspaper 2.0

	//C1: The ratio of newspapers that have at least one advertisement versus the newspapers that haven’t any.
	@Query("select (select count(n) from Newspaper n where n.advertisements.size>1)*1.0/count(ne) from Newspaper ne where ne.advertisements.size=0")
	Double theRatioOfNewspapersAtLeastOneAdvertisementVersusZeroAdvertisement();

	//C2: The ratio of advertisements that have taboo words. Se ha realizado entre la query siguiente y un metodo en el servicio.
	@Query("select count(a) from Advertisement a")
	Double sizeOfTheListAdvertisement();

}
