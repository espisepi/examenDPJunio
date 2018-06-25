
package services;

import java.text.SimpleDateFormat;
import java.util.Date;

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
import domain.Newspaper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class AuditsServiceTest extends AbstractTest {

	// Supporting services ----------------------------------------------------

	@Autowired
	AuditsService		auditsService;

	@Autowired
	NewspaperService	newspaperService;

	@PersistenceContext
	EntityManager		entityManager;


	@Test
	public void driveTestExam() {

		final Object testingData[][] = {
			{
				//Creamos un audits asignandole el newspaper1 cuando lo guardamos en modo final
				"admin", "title", "description", 2, null, "newspaper1", null
			}, {
				//Creamos un audits sin asignarle un newspaper cuando lo guardamos en modo final, por lo tanto falla porque tiene que tener un newspaper asignado
				"admin", "title", "description", 2, null, null, IllegalArgumentException.class
			}

		};

		for (int i = 0; i < testingData.length; i++)
			this.templateTestExam((String) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (int) testingData[i][3], (String) testingData[i][4], (String) testingData[i][5], (Class<?>) testingData[i][6]);

	}

	public void templateTestExam(final String username, final String title, final String description, final int gauge, final String moment, final String newspaperString, final Class<?> expected) {
		Class<?> caught;
		Audits audits;
		Audits newAudits;
		Newspaper newspaper;

		caught = null;

		try {
			this.authenticate(username);

			//Creamos un audits en draftmode
			audits = this.auditsService.create();
			audits.setTitle(title);
			audits.setDescription(description);
			audits.setGauge(gauge);
			audits.setDraftMode(true);
			if (moment != null) {
				final Date date = (new SimpleDateFormat("dd/MM/yyyy HH:mm")).parse(moment);
				audits.setMoment(date);
			}
			audits = this.auditsService.save(audits);
			this.entityManager.flush();

			//Editamos y guardamos en final mode el audits
			newAudits = this.auditsService.findOne(audits.getId());
			newAudits.setDraftMode(false);
			if (newspaperString != null) {
				newspaper = this.newspaperService.findOne(super.getEntityId(newspaperString));
				newAudits.setnewspaper(newspaper);
			}
			newAudits = this.auditsService.save(newAudits);
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
