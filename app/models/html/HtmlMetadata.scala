package models.html

/**
 * Metadata for a specific HTML page of the website
 */
case class HtmlMetadata(canonicalUrl: String, title: String, imageUrl: String, imageAlt: String, description: String, determiner: String) {
	val ogType: String = "website"
	//TODO check determiner fits the og enum (a, an, the, "", auto)
}
