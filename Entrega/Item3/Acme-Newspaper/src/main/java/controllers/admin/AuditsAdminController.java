
package controllers.admin;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.AdminService;
import services.AuditsService;
import services.NewspaperService;
import controllers.AbstractController;
import domain.Audits;
import domain.Newspaper;

@Controller
@RequestMapping(value = "/audits/admin")
public class AuditsAdminController extends AbstractController {

	//Services--------------------------------------------
	@Autowired
	AuditsService		auditsService;

	@Autowired
	AdminService		adminService;

	@Autowired
	NewspaperService	newspaperService;


	//Constructor--------------------------------------------------------
	public AuditsAdminController() {
		super();
	}

	//Listing------------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Audits> auditsList;

		auditsList = this.auditsService.findByAdminId(this.adminService.findByPrincipal().getId());

		result = new ModelAndView("audits/list");
		result.addObject("auditsList", auditsList);
		result.addObject("requestURI", "/audits/admin/list.do");

		return result;
	}

	//Listing with message-------------------------------------------------
	public ModelAndView listWithMessage(final String messageCode) {
		ModelAndView result;

		result = this.list();
		result.addObject("message", messageCode);

		return result;
	}

	//Create-------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;

		result = this.createEditModelAndView(this.auditsService.create());

		return result;
	}

	//Edit-----------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int auditsId) {
		ModelAndView result;
		Audits audits;

		audits = this.auditsService.findOne(auditsId);
		Assert.isTrue(audits.getAdmin().equals(this.adminService.findByPrincipal()), "this is not your audits");
		Assert.isTrue(audits.isDraftMode() == true, "the audits is in final mode");

		result = this.createEditModelAndView(audits);

		return result;

	}
	//Save-----------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(Audits audits, final BindingResult bindingResult) {
		ModelAndView result;

		audits = this.auditsService.reconstruct(audits, bindingResult);
		if (bindingResult.hasErrors())
			result = this.createEditModelAndView(audits);
		else
			try {
				this.auditsService.save(audits);
				result = new ModelAndView("redirect:list.do");
			} catch (final Throwable oops) {
				if (oops.getMessage().equals("moment can not be in past"))
					result = this.createEditModelAndView(audits, "audits.error.momentPast");
				else if (oops.getMessage().equals("this is not your audits"))
					result = this.createEditModelAndView(audits, "audits.error.notYourAudits");
				else if (oops.getMessage().equals("an audits in final mode must have a newspaper"))
					result = this.createEditModelAndView(audits, "audits.error.finalModeWithoutNewspaper");
				else
					result = this.createEditModelAndView(audits, "audits.commit.error");
			}
		return result;
	}

	//Delete-----------------------------------------------------------------
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam final int auditsId) {
		ModelAndView result;

		try {
			this.auditsService.delete(this.auditsService.findOne(auditsId));
			result = this.listWithMessage("audits.commit.successful");
		} catch (final Throwable oops) {
			result = this.listWithMessage("audits.commit.error");
		}

		return result;
	}
	//Auxiliares ---------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Audits audits) {

		Assert.notNull(audits);
		ModelAndView result;
		result = this.createEditModelAndView(audits, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Audits audits, final String messageCode) {
		assert audits != null;
		Collection<Newspaper> newspapers;
		ModelAndView result;

		newspapers = this.newspaperService.findForAudits();

		result = new ModelAndView("audits/edit");
		result.addObject("audits", audits);
		result.addObject("newspapers", newspapers);
		result.addObject("message", messageCode);
		return result;

	}

}
