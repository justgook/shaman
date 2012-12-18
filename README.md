JGit - http://stackoverflow.com/questions/1685228/how-to-cat-a-file-in-jgit
https://github.com/kevinsawicki/gitective/blob/master/README.md
http://viralpatel.net/blogs/introduction-to-hibernate-framework-architecture/


TODO Check it for javascript / data forwarding to special handler
http://download.eclipse.org/jetty/stable-9/apidocs/org/eclipse/jetty/server/handler/ContextHandlerCollection.html


TODO get markdown processor

TODO generate icons list
http://webdesignledger.com/freebies/the-best-icon-sets-for-minimal-style-web-design
http://picol.org/icon_library.php

TODO create combination of LESSCSS + java to generate icon sets based on some mixins - and return sprite (or base64 builded class list) of icons, with only necessary icons

TODO find way to genereate templates
http://ectjs.com/
http://handlebarsjs.com/

TODO draw diogram of program - http://www.gliffy.com/ (or somethink simular)
need to find some UML renders;
read about http://ru.wikipedia.org/wiki/IDEF
base stancils - http://www.graffletopia.com/
http://www.yworks.com/en/products_yed_about.
http://yuml.me/ live image render!
http://plantuml.sourceforge.net/
http://www.codeuml.com/


diagram:

======================================================================================
[Client] .> [WebServer.SocketAPI]
[Client] .> [WebServer.HTTP API]
[WebServer.HTTP API] ..> [Client]
[WebServer.SocketAPI] ..> [Client]

WebServer.SocketAPI->API
[WebServer.HTTP API]->API
[WebServer.StaticFiles]->Client

package "API" {
    [CookieSession]
    [WebSocketSession]
}

package "Core" {
    [User]
    [Privileges]
    [i18n]
    [ModulePrivileges]
}

Git -> ModulePrivileges
package "Git" {
    [repositories]
    [Commits]
}

Issues -> ModulePrivileges

package "Issues" {
    [List]
    [Filter]
    [Ticket]

}
======================================================================================