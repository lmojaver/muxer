module.exports = (grunt) ->
  grunt.initConfig(
    mochaTest:
      test:
        options:
          require: 'coffee-script/register'
        src: ['test/**/*_test.coffee']
  )

  grunt.loadNpmTasks 'grunt-mocha-test'

  grunt.registerTask 'test', ['mochaTest']
