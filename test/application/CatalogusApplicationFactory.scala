package application

import org.scalatestplus.play.FakeApplicationFactory
import play.api._

import java.io.File

/**
 * Trait that creates a new `Application` instance.
 */
trait CatalogusApplicationFactory extends FakeApplicationFactory {

	override def fakeApplication(): Application = {
		val env = Environment.simple(new File("."))
		val context = ApplicationLoader.Context.create(env)
		val loader = new CatalogusApplicationLoader()
		loader.load(context)
	}

}