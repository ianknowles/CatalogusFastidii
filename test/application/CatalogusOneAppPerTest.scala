package application

import org.scalatest.TestSuite
import org.scalatestplus.play.BaseOneAppPerTest

/**
 * Trait that provides a new `Application` instance for each test.
 */
trait CatalogusOneAppPerTest extends BaseOneAppPerTest with CatalogusApplicationFactory {
	this: TestSuite =>
}