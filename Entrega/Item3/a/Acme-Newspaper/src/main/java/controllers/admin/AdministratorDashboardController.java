
package controllers.admin;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.AdminService;
import controllers.AbstractController;
import domain.Newspaper;

@Controller
@RequestMapping(value = "/admin")
public class AdministratorDashboardController extends AbstractController {

	//Services---------------------
	@Autowired
	private AdminService	adminService;


	//Displaying----------------------

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView display() {

		ModelAndView result;
		result = new ModelAndView("administrator/dashboard");
		Double theAvgAndStddevOfNewspapersForUser[];
		Double theAvgAndStddevOfArticlesPerWriter[];
		Double theAvgAndStddevOfArticlePerNewspaper[];
		Collection<Newspaper> newspaperHaveLeast10MorePercentFewerArtclesThanAverage;
		Collection<Newspaper> newspaperHaveLeast10LeastPercentFewerArtclesThanAverage;
		Double theRatioOfUsersWritingNewspaper;
		Double theRatioOfUsersWritingArticle;

		Double theRatioOfNewspapersAtLeastOneAdvertisementVersusZeroAdvertisement;
		Double theRatioOfAdvertisementsThatHaveTabooWords;

		theAvgAndStddevOfNewspapersForUser = this.adminService.theAvgAndStddevOfNewspapersForUser();
		theAvgAndStddevOfArticlesPerWriter = this.adminService.theAvgAndStddevOfArticlesPerWriter();
		theAvgAndStddevOfArticlePerNewspaper = this.adminService.theAvgAndStddevOfArticlePerNewspaper();
		newspaperHaveLeast10MorePercentFewerArtclesThanAverage = this.adminService.newspaperHaveLeast10MorePercentFewerArtclesThanAverage();
		newspaperHaveLeast10LeastPercentFewerArtclesThanAverage = this.adminService.newspaperHaveLeast10LeastPercentFewerArtclesThanAverage();
		theRatioOfUsersWritingNewspaper = this.adminService.theRatioOfUsersWritingNewspaper();
		theRatioOfUsersWritingArticle = this.adminService.theRatioOfUsersWritingArticle();

		theRatioOfNewspapersAtLeastOneAdvertisementVersusZeroAdvertisement = this.adminService.theRatioOfNewspapersAtLeastOneAdvertisementVersusZeroAdvertisement();

		theRatioOfAdvertisementsThatHaveTabooWords = this.adminService.theRatioOfAdvertisementsThatHaveTabooWords();

		result.addObject("theAvgAndStddevOfNewspapersForUser", theAvgAndStddevOfNewspapersForUser);
		result.addObject("theAvgAndStddevOfArticlesPerWriter", theAvgAndStddevOfArticlesPerWriter);
		result.addObject("theAvgAndStddevOfArticlePerNewspaper", theAvgAndStddevOfArticlePerNewspaper);
		result.addObject("newspaperHaveLeast10MorePercentFewerArtclesThanAverage", newspaperHaveLeast10MorePercentFewerArtclesThanAverage);
		result.addObject("newspaperHaveLeast10LeastPercentFewerArtclesThanAverage", newspaperHaveLeast10LeastPercentFewerArtclesThanAverage);
		result.addObject("theRatioOfUsersWritingNewspaper", theRatioOfUsersWritingNewspaper);
		result.addObject("theRatioOfUsersWritingArticle", theRatioOfUsersWritingArticle);

		result.addObject("theRatioOfNewspapersAtLeastOneAdvertisementVersusZeroAdvertisement", theRatioOfNewspapersAtLeastOneAdvertisementVersusZeroAdvertisement);

		result.addObject("theRatioOfAdvertisementsThatHaveTabooWords", theRatioOfAdvertisementsThatHaveTabooWords);

		return result;

	}
}
