
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.AdminRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Admin;
import domain.Newspaper;
import forms.AdminForm;

@Service
@Transactional
public class AdminService {

	// Managed repository -----------------------------------------------------

	@Autowired
	private AdminRepository			adminRepository;

	@Autowired
	private AdvertisementService	advertisementService;

	// Supporting services ----------------------------------------------------

	@Autowired
	private Validator				validator;


	// Constructors -----------------------------------------------------------

	public AdminService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Admin create() {
		Admin result;
		UserAccount userAccount;
		Authority authority;

		result = new Admin();
		userAccount = new UserAccount();
		authority = new Authority();

		authority.setAuthority(Authority.ADMIN);
		userAccount.addAuthority(authority);
		result.setUserAccount(userAccount);

		return result;
	}

	public Collection<Admin> findAll() {
		Collection<Admin> result;
		result = this.adminRepository.findAll();
		Assert.notNull(result);
		return result;
	}

	public Admin findOne(final int adminId) {
		Assert.isTrue(adminId != 0);
		Admin result;
		result = this.adminRepository.findOne(adminId);
		return result;
	}

	public Admin save(final Admin admin) {

		Assert.notNull(admin);
		Admin result;
		Md5PasswordEncoder encoder;
		String passwordHash;

		if (admin.getId() == 0) {
			final String password = admin.getUserAccount().getPassword();
			encoder = new Md5PasswordEncoder();
			passwordHash = encoder.encodePassword(password, null);
			admin.getUserAccount().setPassword(passwordHash);
		}
		result = this.adminRepository.save(admin);

		Assert.notNull(result);

		return result;
	}

	// Other business methods -------------------------------------------------

	public Admin findByPrincipal() {
		Admin result;
		UserAccount userAccount;
		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);
		result = this.adminRepository.findByUserAccountId(userAccount.getId());
		return result;
	}

	public void checkPrincipal() {

		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.ADMIN);

		Assert.isTrue(authorities.contains(auth));
	}

	public boolean checkPrincipalBoolean() {
		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.ADMIN);

		return (authorities.contains(auth));
	}

	//C1
	public Double[] theAvgAndStddevOfNewspapersForUser() {
		this.checkPrincipal();
		Double[] result;
		result = this.adminRepository.theAvgAndStddevOfNewspapersForUser();
		return result;
	}
	//C2
	public Double[] theAvgAndStddevOfArticlesPerWriter() {
		this.checkPrincipal();
		Double[] result;
		result = this.adminRepository.theAvgAndStddevOfArticlesPerWriter();
		return result;
	}
	//C3
	public Double[] theAvgAndStddevOfArticlePerNewspaper() {
		this.checkPrincipal();
		Double[] result;
		result = this.adminRepository.theAvgAndStddevOfArticlePerNewspaper();
		return result;
	}
	//C4
	public Collection<Newspaper> newspaperHaveLeast10MorePercentFewerArtclesThanAverage() {
		this.checkPrincipal();
		Collection<Newspaper> result;
		result = this.adminRepository.newspaperHaveLeast10MorePercentFewerArtclesThanAverage();
		return result;
	}
	//C5
	public Collection<Newspaper> newspaperHaveLeast10LeastPercentFewerArtclesThanAverage() {
		this.checkPrincipal();
		Collection<Newspaper> result;
		result = this.adminRepository.newspaperHaveLeast10LeastPercentFewerArtclesThanAverage();
		return result;
	}
	//C6
	public Double theRatioOfUsersWritingNewspaper() {
		this.checkPrincipal();
		Double result;
		result = this.adminRepository.theRatioOfUsersWritingNewspaper();
		return result;
	}
	//C7
	public Double theRatioOfUsersWritingArticle() {
		this.checkPrincipal();
		Double result;
		result = this.adminRepository.theRatioOfUsersWritingArticle();
		return result;
	}

	public AdminForm reconstruct(final AdminForm adminForm, final BindingResult bindingResult) {
		final AdminForm result;
		final Admin adminBD;

		if (adminForm.getAdmin().getId() == 0) {
			UserAccount userAccount;
			Authority authority;

			userAccount = adminForm.getAdmin().getUserAccount();
			authority = new Authority();
			authority.setAuthority(Authority.ADMIN);
			userAccount.addAuthority(authority);
			adminForm.getAdmin().setUserAccount(userAccount);
			result = adminForm;
		} else {
			adminBD = this.adminRepository.findOne(adminForm.getAdmin().getId());
			adminForm.getAdmin().setId(adminBD.getId());
			adminForm.getAdmin().setVersion(adminBD.getVersion());
			adminForm.getAdmin().setUserAccount(adminBD.getUserAccount());
			result = adminForm;
		}
		this.validator.validate(result, bindingResult);
		return result;
	}

	public void flush() {
		this.adminRepository.flush();
	}

	//Acme-Newspaper 2.0
	//C1: The ratio of newspapers that have at least one advertisement versus the newspapers that havent any.
	public Double theRatioOfNewspapersAtLeastOneAdvertisementVersusZeroAdvertisement() {
		this.checkPrincipal();
		Double result;
		result = this.adminRepository.theRatioOfNewspapersAtLeastOneAdvertisementVersusZeroAdvertisement();
		return result;
	}

	//C2: The ratio of advertisements that have taboo words.
	public Double theRatioOfAdvertisementsThatHaveTabooWords() {
		Double result;
		Double sizeAdvertisement;
		Double sizeAdvertisementWithTabooWord;

		sizeAdvertisementWithTabooWord = this.advertisementService.advertisementWithTabooWord().size() * 1.0;
		sizeAdvertisement = this.adminRepository.sizeOfTheListAdvertisement();

		result = (double) (sizeAdvertisementWithTabooWord / sizeAdvertisement);

		return result;

	}

}
