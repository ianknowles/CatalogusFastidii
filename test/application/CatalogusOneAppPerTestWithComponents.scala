package application

import org.scalatest.TestSuite
import org.scalatestplus.play.components.OneAppPerTestWithComponents

/**
 * Trait that provides a new `Application` instance for each test and provides components.
 */
trait CatalogusOneAppPerTestWithComponents extends OneAppPerTestWithComponents with CatalogusApplicationFactory {
	this: TestSuite =>
}