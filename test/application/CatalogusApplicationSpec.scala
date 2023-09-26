package application

import org.scalatestplus.play._
import play.api.BuiltInComponents
import play.api.test.Helpers._
import play.api.test._

/**
 * Application test spec. Test router and application components.
 *
 * https://www.playframework.com/documentation/latest/ScalaTestingWithComponents
 */
class CatalogusApplicationSpec extends PlaySpec with CatalogusOneAppPerTestWithComponents {
	override def components: CatalogusComponents = new CatalogusComponents(context)

	"CatalogusComponents" should {
		"render the index page from the application components" in {
			val controller = components.homeController
			val home = controller.index().apply(FakeRequest(GET, "/"))

			status(home) mustBe OK
			contentType(home) mustBe Some("text/html")
			contentAsString(home) must include("Welcome to Play")
		}
	}

	"Routes" should {
		"send 404 on a bad request" in {
			route(app, FakeRequest(GET, "/nonexistent")).map(status(_)) mustBe Some(NOT_FOUND)
		}
	}
}
