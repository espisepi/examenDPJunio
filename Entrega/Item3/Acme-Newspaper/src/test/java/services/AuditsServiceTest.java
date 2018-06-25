
package services;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import utilities.AbstractTest;
import domain.Audits;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class AuditsServiceTest extends AbstractTest {

	// Supporting services ----------------------------------------------------

	@Autowired
	AuditsService	auditsService;

	@PersistenceContext
	EntityManager	entityManager;


	@Test
	public void driveTestExam() {

		final Object testingData[][] = {
			{
				"admin", 2, "12/09/2018 10:00", "shortTitle", "description", false, "newShortTitle", null
			}

		};

		for (int i = 0; i < testingData.length; i++)
			this.templateTestExam((String) testingData[i][0], (int) testingData[i][1], (String) testingData[i][2], (String) testingData[i][3], (String) testingData[i][4], (boolean) testingData[i][5], (String) testingData[i][6],
				(Class<?>) testingData[i][7]);

	}

	public void templateTestExam(final String username, final int gauge, final String moment, final String shortTitle, final String description, final boolean finalMode, final String newShortTitle, final Class<?> expected) {
		Class<?> caught;
		Audits audits;

		caught = null;

		try {
			this.authenticate(username);

			//Creamos un Audits en draftmode
			audits = this.auditsService.create();
			audits.setTitle("title test");
			audits.setDescription("description test");
			audits.setGauge(1);
			audits.setDraftMode(true);
			audits = this.auditsService.save(audits);
			this.entityManager.flush();

			this.unauthenticate();
		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);
	}

}
