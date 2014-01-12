module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    meta:
      assets: "assets",
      temp  : "build",
      banner: """
        /* <%= pkg.name %> v<%= pkg.version %> - <%= grunt.template.today("m/d/yyyy") %>
           <%= pkg.homepage %>
           Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %> - Licensed <%= _.pluck(pkg.license, "type").join(", ") %> */

        """

    source:
      coffee: [
        "source/javascripts/*.coffee"]
      stylus: [
        "source/stylesheets/site.*.styl"
        # "source/stylesheets/tuktuk.*.styl"
      ]

    components:
      js : [
        "source/bower_components/jquery/jquery.min.js"
        # "source/bower_components/salvattore/salvattore.min.js"
        "source/bower_components/tuktuk/tuktuk.js"
      ]
      css: [
        # "source/bower_components/tuktuk/tuktuk.css"
        "source/bower_components/tuktuk/tuktuk.icons.css"
        "<%= meta.temp %>/<%= pkg.name %>.css"]

    stylus:
      site:
        options: compress: true, import: [ '__init']
        files: "<%= meta.temp %>/<%= pkg.name %>.css"       : "<%= source.stylus %>"

    concat:
      js : files: '<%=meta.assets%>/js/<%=pkg.name%>.js'    : '<%= components.js %>'
      css: files: '<%=meta.assets%>/css/<%=pkg.name%>.css'  : '<%= components.css %>'


    watch:
      stylus:
        files: ["<%= source.stylus %>"]
        tasks: ["stylus:site", "concat:css"]


  # grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-stylus"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "default", ["stylus", "concat"]
