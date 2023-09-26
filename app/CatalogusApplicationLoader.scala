import controllers.HomeController

import play.api.{Application, ApplicationLoader, BuiltInComponentsFromContext, LoggerConfigurator}
import play.api.routing.Router
import play.filters.HttpFiltersComponents
import router.Routes

/**
 * Application Loader for compile-time Dependency Injection
 * https://www.playframework.com/documentation/latest/ScalaCompileTimeDependencyInjection
 */
class CatalogusApplicationLoader extends ApplicationLoader {
	private var components: CatalogusComponents = _

	def load(context: ApplicationLoader.Context): Application = {
		LoggerConfigurator(context.environment.classLoader).foreach {
			_.configure(context.environment, context.initialConfiguration, Map.empty)
		}
		components = new CatalogusComponents(context)
		components.application
	}
}

/**
 * Application components
 */
class CatalogusComponents(context: ApplicationLoader.Context)
	extends BuiltInComponentsFromContext(context)
		with HttpFiltersComponents
		with controllers.AssetsComponents {

	lazy val homeController: HomeController = new controllers.HomeController(controllerComponents)

	lazy val router: Router = new Routes(httpErrorHandler, homeController, assets)
}
