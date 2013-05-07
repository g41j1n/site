module.exports = (grunt) ->

  grunt.initConfig
    # pkg: grunt.file.readJSON "frontend/component.json"

    meta:
      file: "tuktuk.theme.tapquo.css"
      endpoint: "components/tuktuk",
      banner: """
        /* <%= pkg.name %> v<%= pkg.version %> - <%= grunt.template.today("m/d/yyyy") %>
           <%= pkg.homepage %>
           Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %> - Licensed <%= _.pluck(pkg.license, "type").join(", ") %> */

        """

    source:
      stylesheets: [
        "source/*.styl"]

    stylus:
      stylesheets: files: "<%= meta.endpoint %>/<%= meta.file %>" : "<%= source.stylesheets %>"

    watch:
      stylesheets:
        files: ["<%= source.stylesheets %>"]
        tasks: ["stylus"]


  grunt.loadNpmTasks "grunt-contrib-stylus"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "default", ["stylus"]
