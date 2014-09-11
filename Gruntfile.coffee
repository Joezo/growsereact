module.exports = (grunt) ->

  grunt.initConfig
    connect:
      server:
        options:
          keepalive: true
          base: 'www'
          port: 8888
    watch:
      js:
        files: 'src/js/**/*.js'
        tasks: ['browserify', 'uglify']
      react:
        files: 'src/react_components/**/*.jsx'
        tasks: ['browserify:dist', 'uglify']
    browserify:
      dist:
        options:
          transform: [require('grunt-react').browserify]
        src: ['src/react_components/**/*.jsx']
        dest: 'www/js/app.js'
    uglify:
      dist:
        files:
          'www/js/app.min.js': 'www/js/app.js'


  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-browserify'

  grunt.registerTask 'default', ['browserify', 'uglify', 'connect']
  grunt.registerTask 'compile', ['browserify', 'uglify']
