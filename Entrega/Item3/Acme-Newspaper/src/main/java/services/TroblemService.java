
package services;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.TroblemRepository;
import domain.Troblem;

@Service
@Transactional
public class TroblemService {

	// Managed repository -----------------------------------------------------

	@Autowired
	TroblemRepository	troblemRepository;

	// Supporting services ----------------------------------------------------

	@Autowired
	AdminService		adminService;

	//Importar la que pertenece a Spring
	@Autowired
	private Validator	validator;


	// Constructors -----------------------------------------------------------
	public TroblemService() {

	}

	// Simple CRUD methods ----------------------------------------------------

	public Troblem create() {
		Troblem troblem;

		troblem = new Troblem();
		troblem.setAdmin(this.adminService.findByPrincipal());
		troblem.setTicker(this.generatedTicker());
		troblem.setGauge(1);

		return troblem;
	}

	public Troblem findOne(final int troblemId) {
		Troblem result;

		result = this.troblemRepository.findOne(troblemId);

		return result;
	}

	public Collection<Troblem> findAll() {
		Collection<Troblem> result;

		result = this.troblemRepository.findAll();

		return result;
	}

	public Troblem save(Troblem troblem) {
		Assert.notNull(troblem);
		this.checkSaveAsserts(troblem);

		troblem = this.troblemRepository.save(troblem);

		return troblem;
	}

	public void delete(final Troblem troblem) {
		Assert.notNull(troblem);
		Assert.isTrue(troblem.getAdmin().equals(this.adminService.findByPrincipal()), "this is not your troblem");

		this.troblemRepository.delete(troblem);
	}

	//Other business methods -----------------------------------------------------

	public String generatedTicker() {

		Calendar calendar;

		calendar = Calendar.getInstance();
		String ticker;
		String dias;
		String mes;
		ticker = "";

		dias = String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));
		mes = String.valueOf(calendar.get(Calendar.MONTH) + 1);
		if (dias.length() <= 1)
			ticker = ticker + "0" + String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));
		else
			ticker = ticker + String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));

		if (mes.length() <= 1)
			ticker = ticker + "0" + String.valueOf(calendar.get(Calendar.MONTH) + 1);
		else
			ticker = ticker + String.valueOf(calendar.get(Calendar.MONTH) + 1);
		ticker = ticker + String.valueOf(calendar.get(Calendar.YEAR)).substring(2);

		final char[] arr = new char[] {
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
			'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
		};
		String cadenaAleatoria = "";
		for (Integer i = 0; i <= 1; i++) {
			final char elegido = arr[(int) (Math.random() * 62)];
			cadenaAleatoria = cadenaAleatoria + elegido;

		}

		final char[] arr2 = new char[] {
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
			'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
		};
		String cadenaAleatoria2 = "";
		for (Integer i = 0; i <= 1; i++) {
			final char elegido = arr2[(int) (Math.random() * 62)];
			cadenaAleatoria2 = cadenaAleatoria2 + elegido;

		}

		ticker = cadenaAleatoria2 + ticker + cadenaAleatoria;

		return ticker;
	}

	public Collection<Troblem> findByAdminId(final int adminId) {
		Collection<Troblem> result;

		result = this.troblemRepository.findByAdminId(adminId);

		return result;
	}

	private void checkSaveAsserts(final Troblem troblem) {
		//1- restricciones de los atributos-----------------------------

		//1.1- el moment, si existe, no puede estar en pasado
		if (troblem.getMoment() != null)
			Assert.isTrue(troblem.getMoment().after(new Date()), "moment can not be in past");

		//2- restricciones de las relaciones------------------------------

		//2.1- comprobamos que sea el admin logueado el del troblem
		Assert.isTrue(troblem.getAdmin().equals(this.adminService.findByPrincipal()), "this is not your troblem");

		//2.2- comprobamos que la newspaper asociada puede ser cualquiera, por lo tanto no hace falta comprobar nada

		//2.3- comprobamos que un troblem en final mode tiene que tener un newspaper obligatoriamente
		if (troblem.isDraftMode() == false)
			Assert.notNull(troblem.getnewspaper(), "an troblem in final mode must have a newspaper");
	}

	public Troblem reconstruct(final Troblem troblem, final BindingResult bindingResult) {
		Troblem troblemBD;

		if (troblem.getId() == 0) {
			troblem.setAdmin(this.adminService.findByPrincipal());
			troblem.setTicker(this.generatedTicker());
		} else {
			troblemBD = this.findOne(troblem.getId());
			troblem.setTicker(troblemBD.getTicker());
			troblem.setAdmin(troblemBD.getAdmin());
		}

		this.validator.validate(troblem, bindingResult);

		return troblem;
	}

	public Collection<Troblem> findByNewspaperId(final int newspaperId) {
		Collection<Troblem> result;

		final Date actual = new Date();
		result = this.troblemRepository.findByNewspaperId(newspaperId, actual);

		return result;
	}

}
