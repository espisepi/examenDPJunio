
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
import services.TroblemService;
import services.NewspaperService;
import controllers.AbstractController;
import domain.Troblem;
import domain.Newspaper;

@Controller
@RequestMapping(value = "/troblem/admin")
public class TroblemAdminController extends AbstractController {

	//Services--------------------------------------------
	@Autowired
	TroblemService		troblemService;

	@Autowired
	AdminService		adminService;

	@Autowired
	NewspaperService	newspaperService;


	//Constructor--------------------------------------------------------
	public TroblemAdminController() {
		super();
	}

	//Listing------------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Troblem> troblemList;

		troblemList = this.troblemService.findByAdminId(this.adminService.findByPrincipal().getId());

		result = new ModelAndView("troblem/list");
		result.addObject("troblemList", troblemList);
		result.addObject("requestURI", "/troblem/admin/list.do");

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

		result = this.createEditModelAndView(this.troblemService.create());

		return result;
	}

	//Edit-----------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int troblemId) {
		ModelAndView result;
		Troblem troblem;

		troblem = this.troblemService.findOne(troblemId);
		Assert.isTrue(troblem.getAdmin().equals(this.adminService.findByPrincipal()), "this is not your troblem");
		Assert.isTrue(troblem.isDraftMode() == true, "the troblem is in final mode");

		result = this.createEditModelAndView(troblem);

		return result;

	}
	//Save-----------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(Troblem troblem, final BindingResult bindingResult) {
		ModelAndView result;

		troblem = this.troblemService.reconstruct(troblem, bindingResult);
		if (bindingResult.hasErrors())
			result = this.createEditModelAndView(troblem);
		else
			try {
				this.troblemService.save(troblem);
				result = new ModelAndView("redirect:list.do");
			} catch (final Throwable oops) {
				if (oops.getMessage().equals("moment can not be in past"))
					result = this.createEditModelAndView(troblem, "troblem.error.momentPast");
				else if (oops.getMessage().equals("this is not your troblem"))
					result = this.createEditModelAndView(troblem, "troblem.error.notYourTroblem");
				else if (oops.getMessage().equals("an troblem in final mode must have a newspaper"))
					result = this.createEditModelAndView(troblem, "troblem.error.finalModeWithoutNewspaper");
				else
					result = this.createEditModelAndView(troblem, "troblem.commit.error");
			}
		return result;
	}

	//Delete-----------------------------------------------------------------
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam final int troblemId) {
		ModelAndView result;

		try {
			this.troblemService.delete(this.troblemService.findOne(troblemId));
			result = this.listWithMessage("troblem.commit.successful");
		} catch (final Throwable oops) {
			result = this.listWithMessage("troblem.commit.error");
		}

		return result;
	}
	//Auxiliares ---------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Troblem troblem) {

		Assert.notNull(troblem);
		ModelAndView result;
		result = this.createEditModelAndView(troblem, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Troblem troblem, final String messageCode) {
		assert troblem != null;
		Collection<Newspaper> newspapers;
		ModelAndView result;

		newspapers = this.newspaperService.findForTroblem();

		result = new ModelAndView("troblem/edit");
		result.addObject("troblem", troblem);
		result.addObject("newspapers", newspapers);
		result.addObject("message", messageCode);
		return result;

	}

}
