ThisBuild / scalaVersion := "2.13.11"

ThisBuild / version := "0.1-SNAPSHOT"

lazy val root = (project in file("."))
  .enablePlugins(PlayScala)
  .settings(
    name := """CatalogusFastīdiī""",
    pipelineStages := Seq(digest, gzip),
    libraryDependencies ++= Seq(
      "org.scalatestplus.play" %% "scalatestplus-play" % "5.1.0" % Test,

      "org.webjars" %% "webjars-play" % "2.8.18",
      "org.webjars" % "bootstrap" % "5.3.2",
      "org.webjars.npm" % "bootstrap-icons" % "1.10.3",
    )
  )