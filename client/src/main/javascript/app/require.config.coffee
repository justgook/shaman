jam =
    packages: [
        {
            name: "backbone"
            location: "../../vendor/jam/backbone"
            main: "backbone.js"
        },
        {
            name: "backbone.layoutmanager"
            location: "../../vendor/jam/backbone.layoutmanager"
            main: "backbone.layoutm anager.js"
        },
        {
            name: "jquery"
            location: "../../vendor/jam/jquery"
            main: "jquery.js"
        },
        {
            name: "lodash"
            location: "../../vendor/jam/lodash"
            main: "lodash.js"
        },
        {
            name: "underscore"
            location: "../../vendor/jam/underscore"
            main: "underscore.js"
        },
        {
          name: "use"
          location: "/dev/plugins"
          main: "use.js"
        },
    ]
    version: "0.2.11"
    shim:
        backbone:
            deps: [
                "lodash"
            ],
            exports: "Backbone"
        ,
        "backbone.layoutmanager":
            deps: [
                "jquery"
                "backbone"
                "lodash"
            ],
            exports: "Backbone.LayoutManager"
        underscore:
            exports: "_"

require?.config? {packages: jam.packages, shim: jam.shim}



#else {
#    var require = {packages: jam.packages, shim: jam.shim};
#}
module.exports = jam if exports? and module?

#if (typeof exports !== "undefined" && typeof module !== "undefined") {
#    module.exports = jam;
#}