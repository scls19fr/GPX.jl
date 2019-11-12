using GPX
using TimeZones
using LightXML: XMLDocument, save_file


author = GPXAuthor("S. Celles")

metadata = GPXMetadata(
    name="07/11/2019 LFBI (09:32) LFBI (11:34)",
    author=author,
    time=ZonedDateTime("2019-01-01T00:00:0.000+00:00"), # ZonedDateTime("2019-01-01T00:00:00.000Z") when https://github.com/JuliaTime/TimeZones.jl/pull/227 will be merged
)

gpx = GPXDocument(metadata)

track = new_track(gpx)
track_segment = new_track_segment(track)
point = GPXPoint(0.0, 0.0, 0.0, ZonedDateTime("2019-11-09T09:14:17.473+00:00"), "")
push!(track_segment, point)

# println(gpx)

xdoc = XMLDocument(gpx)

println(xdoc)

fname = "generated.gpx"
save_file(xdoc, fname)
println("GPX file saved to \"$fname\"")
