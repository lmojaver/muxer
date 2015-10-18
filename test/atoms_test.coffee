chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

{ expect } = chai

{FtypAtom, FreeAtom, MdatAtom, MoovAtom} = require '../lib/atoms.coffee'

describe 'Atom', ->
  describe 'Unit Tests', ->
    describe 'Atom', ->
      it 'sets the header'

    describe 'Ftyp Atom', ->
      beforeEach ->
        @ftyp = new FtypAtom 'isom', 512, ['isom', 'iso2', 'avc1']

      it 'sets the major & minor', ->
        expect(@ftyp.major).to.deep.equal(Buffer [0x69, 0x73, 0x6f, 0x6d])
        expect(@ftyp.minor).to.deep.equal(Buffer [0x00, 0x00, 0x02, 0x00])

      it 'sets the brands', ->
        expect(@ftyp.brands).to.deep.equal(
          Buffer [0x69, 0x73, 0x6f, 0x6d, 0x69, 0x73, 0x6f, 0x32, 0x61, 0x76, 0x63, 0x31]
        )
        
      it 'adds the major to brands by default', ->
        @ftyp = new FtypAtom 'isom', 512, ['iso2', 'avc1']
        expect(@ftyp.brands.toString()).to.contain('isom')

    
