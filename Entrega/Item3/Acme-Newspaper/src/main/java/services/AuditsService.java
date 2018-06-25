
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

import repositories.AuditsRepository;
import domain.Audits;

@Service
@Transactional
public class AuditsService {

	// Managed repository -----------------------------------------------------

	@Autowired
	AuditsRepository	auditsRepository;

	// Supporting services ----------------------------------------------------

	@Autowired
	AdminService		adminService;

	//Importar la que pertenece a Spring
	@Autowired
	private Validator	validator;


	// Constructors -----------------------------------------------------------
	public AuditsService() {

	}

	// Simple CRUD methods ----------------------------------------------------

	public Audits create() {
		Audits audits;

		audits = new Audits();
		audits.setAdmin(this.adminService.findByPrincipal());
		audits.setTicker(this.generatedTicker());
		audits.setGauge(1);

		return audits;
	}

	public Audits findOne(final int auditsId) {
		Audits result;

		result = this.auditsRepository.findOne(auditsId);

		return result;
	}

	public Collection<Audits> findAll() {
		Collection<Audits> result;

		result = this.auditsRepository.findAll();

		return result;
	}

	public Audits save(Audits audits) {
		Assert.notNull(audits);
		this.checkSaveAsserts(audits);

		audits = this.auditsRepository.save(audits);

		return audits;
	}

	public void delete(final Audits audits) {
		Assert.notNull(audits);
		Assert.isTrue(audits.getAdmin().equals(this.adminService.findByPrincipal()), "this is not your audits");

		this.auditsRepository.delete(audits);
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

	public Collection<Audits> findByAdminId(final int adminId) {
		Collection<Audits> result;

		result = this.auditsRepository.findByAdminId(adminId);

		return result;
	}

	private void checkSaveAsserts(final Audits audits) {
		//1- restricciones de los atributos-----------------------------

		//1.1- el moment, si existe, no puede estar en pasado
		if (audits.getMoment() != null)
			Assert.isTrue(audits.getMoment().after(new Date()), "moment can not be in past");

		//2- restricciones de las relaciones------------------------------

		//2.1- comprobamos que sea el admin logueado el del audits
		Assert.isTrue(audits.getAdmin().equals(this.adminService.findByPrincipal()), "this is not your audits");

		//2.2- comprobamos que la newspaper asociada puede ser cualquiera, por lo tanto no hace falta comprobar nada

		//2.3- comprobamos que un audits en final mode tiene que tener un newspaper obligatoriamente
		if (audits.isDraftMode() == false)
			Assert.notNull(audits.getnewspaper(), "an audits in final mode must have a newspaper");
	}

	public Audits reconstruct(final Audits audits, final BindingResult bindingResult) {
		Audits auditsBD;

		if (audits.getId() == 0) {
			audits.setAdmin(this.adminService.findByPrincipal());
			audits.setTicker(this.generatedTicker());
		} else {
			auditsBD = this.findOne(audits.getId());
			audits.setTicker(auditsBD.getTicker());
			audits.setAdmin(auditsBD.getAdmin());
		}

		this.validator.validate(audits, bindingResult);

		return audits;
	}

	public Collection<Audits> findByNewspaperId(final int newspaperId) {
		Collection<Audits> result;

		final Date actual = new Date();
		result = this.auditsRepository.findByNewspaperId(newspaperId, actual);

		return result;
	}

}
