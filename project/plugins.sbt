addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "2.8.19")
addSbtPlugin("com.typesafe.sbt"  % "sbt-gzip"    % "1.0.2")
addSbtPlugin("com.typesafe.sbt"  % "sbt-digest"  % "1.1.4")

ThisBuild / libraryDependencySchemes += "org.scala-lang.modules" %% "scala-xml" % VersionScheme.Always
