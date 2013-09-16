Keyframes = require('../lib/autoprefixer/keyframes')
CSS       = require('../lib/autoprefixer/css')
cases     = require('./lib/cases')

describe 'Keyframes', ->
  beforeEach ->
    @nodes      = cases.load('css/keyframes')
    @rules      = @nodes.stylesheet.rules
    @css        = new CSS(@nodes.stylesheet)
    @css.number = 0
    @keyframes  = new Keyframes(@css, 0, @rules[0])

  describe 'clone()', ->

    it 'clones node', ->
      @rules[0].one = 1
      @rules[0].keyframes[0].one = 1
      clone = @keyframes.clone()

      clone.one.should.eql 1
      clone.keyframes[0].one.should.eql 1

  describe 'cloneWithPrefix()', ->

    it 'adds prefix to cloned one', ->
      @keyframes.cloneWithPrefix('-moz-')

      @rules.length.should.eql(6)
      @rules[0].vendor.should == '-moz-'

  describe 'remove()', ->

    it 'removes node', ->
      @keyframes.remove()
      @rules.length.should.eql(4)
