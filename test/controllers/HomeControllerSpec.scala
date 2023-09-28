package controllers

import application.CatalogusOneAppPerTest
import org.scalatestplus.play._
import play.api.test.Helpers._
import play.api.test._

/**
 * Home Controller Test Spec
 *
 * https://www.playframework.com/documentation/latest/ScalaTestingWithScalaTest
 */
class HomeControllerSpec extends PlaySpec with CatalogusOneAppPerTest {

	"HomeController GET" should {

		"render the index page from a new instance of controller" in {
			val controller = new HomeController(stubControllerComponents(), app.configuration)
			val home = controller.index().apply(FakeRequest(GET, "/"))

			status(home) mustBe OK
			contentType(home) mustBe Some("text/html")
			charset(home) mustBe Some("utf-8")
			contentAsString(home) must include("Welcome to Play")
		}

		"render the index page from the router" in {
			val request = FakeRequest(GET, "/")
			val home = route(app, request).get

			status(home) mustBe OK
			contentType(home) mustBe Some("text/html")
			charset(home) mustBe Some("utf-8")
			contentAsString(home) must include("Welcome to Play")
			contentAsString(home) must include("<meta property=\"og:image:alt\" content=\"The index page of the Catalogus Fastīdiī website.\" />")
		}
	}
}
