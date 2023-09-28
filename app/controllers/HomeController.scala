package controllers

import javax.inject._
import play.api._
import play.api.i18n.I18nSupport
import play.api.mvc._

/**
 * Controller for simple pages
 */
@Singleton
class HomeController @Inject()(val controllerComponents: ControllerComponents, implicit val config: Configuration) extends BaseController with I18nSupport {

	/**
	 * Render the index page from its HTML template
	 */
	def index(): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
		Ok(views.html.index())
	}
}
