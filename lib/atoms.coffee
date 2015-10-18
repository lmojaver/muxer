class Atom
  constructor: (fourcc) ->
    @header = new Buffer.concat [
      new Buffer(4).fill(0),
      new Buffer(4).fill(fourcc)
    ]

class SubAtom
  constructor: (@fourcc) ->


class FtypAtom extends Atom
  constructor: (major, minor, brands) ->
    @major = new Buffer major

    if minor.constructor is Number
      @minor = new Buffer(4).fill(0)
      @minor.writeUInt32BE minor
    else
      @minor = new Buffer minor

    if brands.constructor is Array
      if major not in brands
        brands.unshift major
      brands = brands.join ''
    else if brands.constructor is String and brands.indexOf(major) is -1
      brands += major
    @brands = new Buffer brands

    super 'ftyp'

class MdatAtom extends Atom
  constructor: (data) ->
    @data = new Buffer data

class FreeAtom extends Atom
  constructor: (space) ->
    @space = new Buffer(space).fill(0)
    super 'free'

class MoovAtom extends Atom
  constructor: ->
    @mvhd = null
    @trak = null
    @mdia = null
    @minf = null
    @stbl = null

class MvhdAtom
  constructor: ->
    @version = null
    @flags = null
    @created = null
    @modified = null
    @timeScale = null
    @duration = null
    @playbackSpeed = null
    @volume = null
    @reserved = null
    @wgmvA = null
    @wgmvB = null
    @wgmvU = null
    @wgmvC = null
    @wgmvD = null
    @wgmvV = null
    @wgmvX = null
    @wgmvY = null
    @wgmvW = null
    @qtPreview = null
    @qtPoster = null
    @qtSelection = null
    @qtCurrent = null
    @nextTrackId = null

class TrakAtom
  constructor: ->
    @tkhd = null

class TkhdAtom
  constructor: ->
    @version = null
    @flags = null
    @created = null
    @modified = null
    @trackId = null
    @duration = null
    @reserved2 = null
    @layer = null
    @alternate = null
    @volume = null
    @reserved3 = null
    @matrix = null
    # @matrix[0]...
    @width = null
    @height = null

class MdiaAtom
  constructor: ->
    @mdhd = null
    @hdlr = null

class MdhdAtom
  constructor: ->
    @version = null
    @flags = null
    @created = null
    @modified = null
    @timeScale = null
    @duration = null
    @padding = null
    @language = null
    @quality = null

class HdlrAtom
  constructor: ->
    @version = null
    @flags = null
    @handlerType = null
    @componentType = null
    @manufacturer = null
    @componentFlags = null
    @componentFlagsMask = null
    @componentName = null
    @flavor = null

class MinfAtom
  constructor: ->
    @vmhd = null
    # optional hdlr
    @dinf = null

class VmhdAtom
  constructor: ->
    #sub init
    @graphicMode = null
    @opColor = null

class DinfAtom
  constructor: ->
    @dref = null

class DrefAtom
  constructor: ->
    #sub init
    @referenceCount = null

    @url = null

class URLAtom
  constructor: ->
    # sub init
    @url = null
    @end = 0x0

class StblAtom
  constructor: ->
    @stsd = null
    @stts = null
    @stss = null
    @stsc = null
    @stsz = null

class StsdAtom
  constructor: ->
    # sub init
    @descriptionCount = null

    @length = null
    @format = null
    @reserved = null
    @index = null
    @version = null
    @revisiionLevel = null
    @vendor = null
    @temporalQuality = null
    @spatialQuality = null
    @pixelSize = null
    @resolution = null
    @dataSize = null
    @frameCount = null
    @encoderLength = null
    @encoder = null
    @pixelDepth = null
    @colorTableId = null
    @extensionAtoms = null

class AVCDecodeAtom
  constructor: ->
    @version = null
    @h264Profile
    @h264CompatProfiles = null
    @h264Level = null
    @reserved = null
    @nalLength = null
    @spsCount = null
    @spsLength = null
    @sps = null
    @ppsCount = null
    @ppsLength = null
    @pps = null

class SttsAtom
  constructor: ->
    #sub init
    @numberOfTimes = null
    @timePerFrame = null

class StssAtom
  constructor: ->
    # sub init
    @keyFrameCount = null
    @keyIntraLocation = null

class StscAtom
  constructor: ->
    # sub init
    @blockCount = null
    @framesPerBlock = null
    @samplesDescriptionId = null

class StszAtom
  constructor: ->
    # sub init
    @blockSize = null
    @blockSizeCount = null
    @blockSizes = null

class StcoAtom
  constructor: ->
    #sub init
    @offsetCount = null
    @offsets = null

class UdtaAtom
  constructor: ->
    # sub init
    @meta = null
    #compat end?

class MetaAtom
  constructor: ->
    # sub init
    @hdlr = null
    @ilst = null

class IlstAtom
  constructor: ->
    # sub init
    @type = null
    @data = null

class DataAtom
  constructor: ->
    # sub init
    @reserved = null
    @data = null

Array::remove = (obj) ->
  @filter (el) -> el isnt obj

module.exports = {
  FtypAtom
  FreeAtom
  MdatAtom
  MoovAtom
}
