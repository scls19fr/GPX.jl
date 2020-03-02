using GPX
using GPX: read_gpx_file

fname = joinpath("..", "sample", "data", "sample.gpx")
println(fname)
itr = read_gpx_file(fname)
# positions = collect(itr)
# println(positions)
