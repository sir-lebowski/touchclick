module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      dist:
        files:
          'touchclick.js': 'src/touchclick.coffee'
        options:
          bare: true
      test:
        files:
          'tmp/touchclick.js': 'src/touchclick.coffee'
          'tmp/spec/test.js': 'test/spec/test.coffee'

    clean:
      test: ['tmp']

    mocha:
      test:
        src: ['test/index.html']
        options:
          bail: true
          log: true
          reporter: 'Nyan'
          run: true
          timeout: 10000
          mocha:
            ignoreLeaks: false

  # Load installed tasks
  grunt.file.glob
  .sync('./node_modules/grunt-*/tasks')
  .forEach(grunt.loadTasks)

  # Shortcuts
  grunt.registerTask 'test', ['clean', 'coffee:test', 'mocha']
  grunt.registerTask 'b', ['test', 'coffee:dist', 'clean']

  # Default task
  grunt.registerTask 'default', 'b'